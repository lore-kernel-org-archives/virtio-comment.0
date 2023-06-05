Return-Path: <virtio-comment-return-6132-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DBDC7EE23
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 12:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 503FA60046
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 12:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37F72986447
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 12:50:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2778598638A; Mon,  5 Jun 2023 12:50:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1493C9863AC
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685969431; x=1688561431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEYs1IXTcQQS6axpbreLjLOxY/dnm0Qp38jNoX1YL9g=;
        b=VIyQLyGx5iZN/giT6fZjZ9x1yT2IpLQt7Di9VzNQyutgOLLFi+DO04qrohWQFDKGPO
         WDypRWIzBpgyER1uYMsZB+azr/x6zWZqOCtkC5pK2pi29UkBsjcvA6g7Jt6hq7UfF8EY
         DbxfghIdBEZp9wW05qkVvQQAwjaHIMS0+JoXJQyfcrdQD9m55DiNZa/ixrNC95rNMSgh
         whL2m4Edy82PBozCMDra5PmBhOyDGd2v2XkkEaE8ZkzC4WMgtyTxgDDyylPzgOwoAjsr
         H3IONG8IulXlMijW3zz0+eenwQFOqLf3MF5eHfKTXVQSI+taqZgrvB9zO/QUkC4vAyN2
         F33g==
X-Gm-Message-State: AC+VfDwE42MvfW6tMdEe+22MNTZSKTJKFaq+/gQsTcBg6A5ygR7fp88j
	I7G8Vr7YAvZjFJk/0TPFUzukOg==
X-Google-Smtp-Source: ACHHUZ4pvYiZ38cdOZKeV8dTC8jejgpyT91XHLRjjw/G+wLopWDAD9UxWW8rN1Ao7FFCTpSxo/szVg==
X-Received: by 2002:a05:6a00:10ca:b0:64b:50:2410 with SMTP id d10-20020a056a0010ca00b0064b00502410mr13283417pfu.19.1685969430978;
        Mon, 05 Jun 2023 05:50:30 -0700 (PDT)
Message-ID: <fe6a7f09-6ee5-25d0-ea7e-ef4d77a37263@bytedance.com>
Date: Mon, 5 Jun 2023 20:50:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Parav Pandit <parav@nvidia.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
 <5c3600cd-4c9f-9d1f-a807-13ed54f6b11f@bytedance.com>
 <PH0PR12MB548194DBF9A205173DFE8042DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <PH0PR12MB548194DBF9A205173DFE8042DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: RE: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

On 6/5/23 19:45, Parav Pandit wrote:
> 
> 
>> From: zhenwei pi <pizhenwei@bytedance.com>
>> Sent: Monday, June 5, 2023 4:41 AM
>>
>> On 6/5/23 10:41, Parav Pandit wrote:
>>>
>>>
>>> On 5/4/2023 4:19 AM, zhenwei pi wrote:
>>>> Keyed transmission is used for message oriented communication(Ex
>>>> RDMA), also add virtio-blk read/write 8K example.
>>>>
>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>> ---
>>>
>>>> +An example of a virtio-blk write 8K request(message size:
>>>> sizeof(Command) +
>>>> +4 * sizeof(Descriptor)):
>>>> +\begin{lstlisting}
>>>> + COMMAND            +------+
>>>> +                    |opcode|  ->  virtio_of_op_vring
>>>> +                    +------+
>>>> +                    |cmd id|  ->  10
>>>> +                    +------+
>>>> +                    |length|  ->  0
>>>> +                    +------+
>>>> +                    |ndesc |  ->  4
>>>> +                    +------+
>>>> +                    |rsvd  |
>>>> +                    +------+
>>>> +
>>>> + DESC0              +------+
>>>> +                    |addr  |  -> 0xffff012345670000
>>>> +                    +------+
>>>> +                    |length|  -> 16 (virtio blk write command)
>>>> +                    +------+
>>>> +                    |id    |  -> 0
>>>> +                    +------+
>>>
>>> for RDMA this id is not useful. It can be omitted.
>>> still parsing the rest.
>>>
>>> if we talk blk as an example, above command descriptor can be of 32
>>> bytes, such as struct virtio_of_cmd {
>>>       u8 opcode;
>>>       u8 rsvd;
>>>       le16 cmd_id;
>>>       u8 inline_desc_cnt;
>>>       u8 rsvd[3];
>>>       /* some padding/metadata for long desc list if any */ };
>>>
>>> struct virtio_of_rdma_desc {
>>>       le64 addr;
>>>       le32 length;
>>>       le32 rdma_key;
>>> };
>>>
>>> struct virtio_rdma_op {
>>>       struct virtio_of_cmd cmd;
>>>       struct virtio_of_rdma_desc desc[1 or 3]; /* count can be
>>> negotiated */ };
>>>
>>> With this a send and receive queue on initiator and target can
>>> exchange, cmd descriptor for read/writes.
>>>
>>
>> Hi,
>>
>> Do you mean that separating a Virtio Over RDMA queue into 2 QP, one for
>> sending, another one for receiving?
>>
> No. just one QP.
> 
> Initiator_QP_A -> target_QP_B.
> 
> When initiator QP A sends 32B cmd, it lands in the target QP B's receive queue.
> 
> After this target can do one or more read/write DMA using RDMA read/write from the initiator's memory.
> 

Hi, I have several questions:
1, how to tell the target to read/write DMA using RDMA read/write? is 
virtio_of_rdma_desc missing?

2, if several virtio_of_rdma_desc arrives, the target need to 
distinguish READ * m + WRITE * n descriptors. but *flags* field has been 
removed ...

3, if I understand correctly, Initiator_QP_A -> Target_QP_B(CMD), 
Target_QP_B(RDMA READ), Target_QP_B(RDMA WRITE), Target_QP_B -> 
Initiator_QP_A(COMP). this uses 4 RTT.

> Finally target_QP_B sends 8B completion, it arrives in the QP_A's receive queue.

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

