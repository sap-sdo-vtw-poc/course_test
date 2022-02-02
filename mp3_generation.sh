#!/bin/bash
for pres in "$@"
do 
    JSON_DATA=$(cat $pres | jq .)
    CELLS_NUMBRS=$(cat $pres | jq -r  '.cells | length')
    ONE=1
    CELLS_NUMBRS_MINUS="$(($CELLS_NUMBRS-$ONE))"

    START_CELL=0
    declare slide_number_{'en','de','fr','it','es','cn','jp','kr'}="$START_CELL"
    AUDIO_DIR=$(echo $pres | cut -d "." -f1)
    for NUMBER_OF_CELL in $(seq $START_CELL $CELLS_NUMBRS_MINUS)
    do
        CELL_ITERATION=$(echo $JSON_DATA | jq --arg index "$NUMBER_OF_CELL" '.cells | .[$index | tonumber] | select(.metadata.slideshow.slide_type | contains("note"))')
        language=$(echo $JSON_DATA | jq -r --arg index "$NUMBER_OF_CELL" '.cells | .[$index | tonumber] | .metadata.lang')
        if [ ! -z "$CELL_ITERATION" ] && [ "$language" == "en" ]
        # English
        then
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_en-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='en-US'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='en-US' xml:gender='Female' name='en-US-JennyNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_en=$(($slide_number_en+1))
        elif [ ! -z "$CELL_ITERATION" ] && [ "$language" == "de" ]
        # German
        then
            # echo "note for slide № $(expr $NUMBER_OF_CELL - 1)  "
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_de-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='de-DE'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='de-DE' xml:gender='Female' name='de-DE-KatjaNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_de=$(($slide_number_de+1))
        elif [ ! -z "$CELL_ITERATION" ] && [ "$language" == "fr" ]
        #French
        then
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_fr-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='fr-FR'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='fr-FR' xml:gender='Female' name='fr-CH-ArianeNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_fr=$(($slide_number_fr+1))
        elif [ ! -z "$CELL_ITERATION" ] && [ "$language" == "it" ]
        #Italian
        then
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_it-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='it-IT'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='it-IT' xml:gender='Female' name='it-IT-ElsaNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_it=$(($slide_number_it+1))
        elif [ ! -z "$CELL_ITERATION" ] && [ "$language" == "es" ]
        #Spanish
        then
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_es-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='es-ES'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='es-ES' xml:gender='Female' name='es-ES-ElviraNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_es=$(($slide_number_es+1))
        elif [ ! -z "$CELL_ITERATION" ] && [ "$language" == "zh-tw" ]
        #Chines
        then
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_cn-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='zh-CN'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='zh-CN' xml:gender='Female' name='es-ES-ElviraNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_cn=$(($slide_number_cn+1))
        elif [ ! -z "$CELL_ITERATION" ] && [ "$language" == "ja" ]
        #Japanese
        then
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_jp-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='ja-JP'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='ja-JP' xml:gender='Female' name='ja-JP-NanamiNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_jp=$(($slide_number_jp+1))
        elif [ ! -z "$CELL_ITERATION" ] && [ "$language" == "ko" ]
        #Korean
        then
            out=$(echo $CELL_ITERATION | jq -r '.source[]')
            output_file_name=$(echo "slide-$slide_number_kr-0")
            mkdir -p audio && cd ./audio && mkdir -p $AUDIO_DIR/$language && cd ./$AUDIO_DIR/$language
            echo $out
            echo "<speak version='1.0' xml:lang='ko-KR'>" > $output_file_name.xml && \
            echo "    <voice xml:lang='ko-KR' xml:gender='Female' name='ko-KR-SunHiNeural'>" >> $output_file_name.xml && \
            echo "        $out" >> $output_file_name.xml && \
            echo '    </voice>' >> $output_file_name.xml && \
            echo '</speak>' >> $output_file_name.xml
            cat $output_file_name.xml |  curl --location --request POST "https://$AZURE_REGION.tts.speech.microsoft.com/cognitiveservices/v1" \
            --header "Ocp-Apim-Subscription-Key: $AZURE_SPEECH_KEY" \
            --header 'Content-Type: application/ssml+xml' \
            --header 'X-Microsoft-OutputFormat: audio-16khz-32kbitrate-mono-mp3' \
            --header 'User-Agent: curl' \
            --data @- > $output_file_name.mp3
            rm -rf $output_file_name.xml
            pwd
            cd ../../../
            pwd
            slide_number_kr=$(($slide_number_kr+1))
        fi
        sleep 4
    done
    sleep 5
done

