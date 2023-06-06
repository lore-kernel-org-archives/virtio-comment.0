Return-Path: <virtio-comment-return-6148-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA909C77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 02:05:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 18D6B26A26
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 02:05:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFF7898648A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 02:05:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD57798590A; Tue,  6 Jun 2023 02:05:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32FAE986488
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 02:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686017104; x=1688609104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dDTllV+NLu6WmzIXe/+uaoWXBqzmZWstWlNUqiXjYqM=;
        b=cTJsyk4CB/BWhysT1kIUwHvaWp3tQ3GgyFUuM300duZkkFOaVjqWDZnTbfvicvKipu
         z27QOC/S20LYw6k7feFF2mB4nNx3264aGbziKKck6Zsrqi2B6BPduaWUsgmvTCz/H94U
         oKz3Y8E/VFSz5KXPxAMBd0cPOnx+eB0jvX1xKfaydwSZ9FtHKafWIIEyggk9Slq9ZAk/
         pxyXWxbqvIVgT2Pd9iTl32WwsBpsmZcwBPBOfMlEtDwPwuL65U0rqANIyPAe4YO474sS
         fDCHLsBMwtu143b6ZCPD9rioejrXaQkNtlOyTcIbtaysZ4JZ28cv/uU8L86bLP3/aPcA
         hY7A==
X-Gm-Message-State: AC+VfDyz8M3pmGnDzYSRLIC4tAUHZgkPOkJvl/3zTTj8y7LE5pyJEeep
	0dEiTnQGC0z2Ka2qWhG1EOY5sA==
X-Google-Smtp-Source: ACHHUZ419BuaMUkkXHaRScDwyDzTZUlJy8BY90/a5vDcwKMzY+awvvvpCbT7V+GJRGCAgvAhHEn3/g==
X-Received: by 2002:a05:6358:c122:b0:129:c27d:9f1f with SMTP id fh34-20020a056358c12200b00129c27d9f1fmr832045rwb.5.1686017104333;
        Mon, 05 Jun 2023 19:05:04 -0700 (PDT)
Message-ID: <5756d99a-6ffc-3b8e-6488-19d17a1c0ec2@bytedance.com>
Date: Tue, 6 Jun 2023 10:02:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230605163046.GB1624556@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce command set



On 6/6/23 00:30, Stefan Hajnoczi wrote:
[snip]
>>
>>>> +
>>>> +The Target ID of 0xffff is reserved, then:
>>>
>>> Please move this after the fields have been shown and the purpose of the
>>> Target ID field has been explained.
>>>
>>>> +\begin{itemize}
>>>> +\item The Target ID of 0xffff MUST be specified as the Target ID in a Connect
>>>> +Command for the control queue.
>>>> +\item The target SHOULD allocate any available Target ID to the initiator,
>>>> +and return the allocated Target ID in the Completion.
>>>> +\item The returned Target ID MUST be specified as the Target ID, and the Queue ID
>>>> +MUST be specified in a Connect Command for the virtqueue.
>>>> +\end{itemize}
>>>
>>> What is the purpose of the Target ID? Is it to allow a server to provide
>>> access to multiple targets over the same connection?
>>>
>>
>> A target listens on a port, and provides access to 0 or more targets. An
>> initiator connect the specific target by TVQN of connect command.
>> An initiator could connect a single target, multiple initiators could
>> connect the same target(typically, shared disk/fs).
> 
> Why is the target ID separate from the TVQN? If the Target ID is a
> separate parameter then users will have to learn additional
> syntax/command-line options to specify the TVQN + Target ID and that
> syntax may vary between software.
> 

The TVQN is the location of a target, for example:
virtio-tcp://192.168.1.110:8549/blk-dev/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1

A target can be shared by multi initiators, they accesses the target by 
the same address(transport: tcp, ip: 192.168.1.110, port: 8549, TVQN: 
blk-dev/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1):

Initiator_A launches Control Queue, issues connect command, gets the 
Target ID of Target_A(typically, dynamically allocated by target), then 
virtqueues connect to Target_A.

Initiator_B launches Control Queue, issues connect command, gets the 
Target ID of Target_B(typically, dynamically allocated by target), then 
virtqueues connect to Target_B.

...

Once an initiator disconnects, the target should reclaim the Target ID.

[snip]

-- 
zhenwei pi

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

