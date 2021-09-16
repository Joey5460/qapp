import QtQuick 2.5
import QtQuick.Controls 2.12

import "../jdenticon/jdenticon.js" as Jdenticon


Item{
    Image {
        id: image
		visible:false
    }
    Canvas {
        readonly property variant jdenticon_default_config: {
            "backColor" : "#00000000",
            "lightness" : {
                color: [0.4, 0.8],
                grayscale: [0.3, 0.9]
            },
            "saturation" : {
                color: 0.75,
                grayscale: 0
            },
            "padding" : 0.08
        };
        property string pk 
        id: iconGenerator
        width: 256
        height: width
        visible: false
        onPaint: {
            var cxt = getContext("2d");
            Jdenticon.global.jdenticon_config = jdenticon_default_config
            Jdenticon.global.jdenticon_config.hues = getJdenticonHues(pk)
            Jdenticon.drawIcon(cxt, pk, width)
        }
        function getJdenticonHues(pk) {
            var hash = Jdenticon.sha1(pk)
            var result = []
            for (var i = 0; i < hash.length; i += 8) {
                result.push(parseInt(hash.substring(i, i + 8), 16) / 4294967295 * 360)
            }
            return result
        }
    }


   function genAvatar(id)
   {
       iconGenerator.requestPaint()
       iconGenerator.grabToImage(function(result){
       result.saveToFile("../shared/"+id+".png")});
       //var url = canvas.toDataURL('image/png')
       //print('image url=', url)
   }
}
