Return-Path: <virtio-comment-return-6193-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D608C7EE29
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:06:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A83A171C8D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:06:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F05998658A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:06:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C4FE986583; Wed,  7 Jun 2023 02:06:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 64C36986585
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 02:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686103558; x=1688695558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feONbb1aRmGIBkDZqlQnRmXQv0A5xB1tveq7lArq3vE=;
        b=L0WZenjJsJguAv/bj3BBtcroRyICYU8vF8MKFNX5EoG8lzXbppY8/0+86NbE/qhpTb
         YKVuNCxTwHvOB3qBJBT1qZeJnbQ6DLHnbdtZS/2JcmhiekAAbgn0pJnAIACFjKLfd+77
         ILsiOH6BG8VhPZBTIJlye+WtqCqP0JmIIEDMLX7vY1oMMNpc+YBOMZo7J1jk7GNT2PX2
         C0sblO3WUwgjGhFptyIh0paoSN90oneozBnWxvp0UfCE/ZbfnUadKRMPtWVc2c9qTH5e
         y+6VIfllzYlVc+YGze0hcv9bfWRALSq5jedQUx1HYOcbPSzVtULIrjqZbAlZ97AveF+2
         AGmg==
X-Gm-Message-State: AC+VfDxddQof71K5NFJDdQP4/HevkAlL77saOXTHaxH1BrfGlrYtMeEu
	ztTRlhI0IuPoqwb/E29OeCDg7Q==
X-Google-Smtp-Source: ACHHUZ4APVzE3iiAAVItdIuxzfsyWYRLs/1OOTBNIiBM7N99oBo1Q3Ayvb5u/1zumMKZz3wpI77rgA==
X-Received: by 2002:a05:6830:1b6c:b0:6af:a27f:66c7 with SMTP id d12-20020a0568301b6c00b006afa27f66c7mr3616131ote.9.1686103558605;
        Tue, 06 Jun 2023 19:05:58 -0700 (PDT)
Message-ID: <92b404ff-fe81-ba8e-228b-b264c24d1274@bytedance.com>
Date: Wed, 7 Jun 2023 10:03:45 +0800
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
 <5756d99a-6ffc-3b8e-6488-19d17a1c0ec2@bytedance.com>
 <20230606134419.GD1958291@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230606134419.GD1958291@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce command
 set



On 6/6/23 21:44, Stefan Hajnoczi wrote:
> On Tue, Jun 06, 2023 at 10:02:51AM +0800, zhenwei pi wrote:
>>
>>
>> On 6/6/23 00:30, Stefan Hajnoczi wrote:
>> [snip]
>>>>
>>>>>> +
>>>>>> +The Target ID of 0xffff is reserved, then:
>>>>>
>>>>> Please move this after the fields have been shown and the purpose of the
>>>>> Target ID field has been explained.
>>>>>
>>>>>> +\begin{itemize}
>>>>>> +\item The Target ID of 0xffff MUST be specified as the Target ID in a Connect
>>>>>> +Command for the control queue.
>>>>>> +\item The target SHOULD allocate any available Target ID to the initiator,
>>>>>> +and return the allocated Target ID in the Completion.
>>>>>> +\item The returned Target ID MUST be specified as the Target ID, and the Queue ID
>>>>>> +MUST be specified in a Connect Command for the virtqueue.
>>>>>> +\end{itemize}
>>>>>
>>>>> What is the purpose of the Target ID? Is it to allow a server to provide
>>>>> access to multiple targets over the same connection?
>>>>>
>>>>
>>>> A target listens on a port, and provides access to 0 or more targets. An
>>>> initiator connect the specific target by TVQN of connect command.
>>>> An initiator could connect a single target, multiple initiators could
>>>> connect the same target(typically, shared disk/fs).
>>>
>>> Why is the target ID separate from the TVQN? If the Target ID is a
>>> separate parameter then users will have to learn additional
>>> syntax/command-line options to specify the TVQN + Target ID and that
>>> syntax may vary between software.
>>>
>>
>> The TVQN is the location of a target, for example:
>> virtio-tcp://192.168.1.110:8549/blk-dev/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
>>
>> A target can be shared by multi initiators, they accesses the target by the
>> same address(transport: tcp, ip: 192.168.1.110, port: 8549, TVQN:
>> blk-dev/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1):
>>
>> Initiator_A launches Control Queue, issues connect command, gets the Target
>> ID of Target_A(typically, dynamically allocated by target), then virtqueues
>> connect to Target_A.
>>
>> Initiator_B launches Control Queue, issues connect command, gets the Target
>> ID of Target_B(typically, dynamically allocated by target), then virtqueues
>> connect to Target_B.
> 
> In your example you say "A target can be shared by multi initiators" but
> then say "Target_A" and "Target_B", so the two initiators are not really
> communicating with the same target?
> 

Yes, the two initiators are actually communicating with the same target 
of two Device Instances.

> Maybe instead of Target ID it should be called Device Instance ID? Then
> the "Target" is the server that listens on 192.168.1.110:8549 and the
> "Device Instance" is the VIRTIO device that the initiator is accessing
> through the Target. One Target may contain many Device Instances.
> 
> I think that's clearer than calling boths Targets and Device Instances
> the same thing.
> 
> Stefan

OK, this seems better! Fix this in next version.

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

