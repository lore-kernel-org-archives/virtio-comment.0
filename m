Return-Path: <virtio-comment-return-6127-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BD4C7EE23
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 08:43:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 867653309F
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 08:43:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BB1798643F
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 08:43:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53A5B98638A; Mon,  5 Jun 2023 08:43:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 405269863AC
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 08:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685954606; x=1688546606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlOVl3n+s+wLdIcyFvxLsE7h5u4KfkGqLMWy3u/nUbg=;
        b=RkJPwycMnc+W216cq50CHiNk1L3j2WVMsawhekho7fPVFtzsmpDu68PvMeGsxoPvJ8
         Ap6R86Rp7HvrkjGbQV5gFfA/r8YVUxSPcFb40hdIuqglY73kWpzdSE7bjZC8Pbix23OL
         dKLD02hUhKGRQ7wAFJg+0oSbgVmNLhR96MTCYt8RxbSXIUBqT8iYctUFANw0E+ciVFej
         Bb/YN1sUS45QR3mNuPZlLFg8k7544Gao1nJKIgUDnaEV200kJfisJDR8e2k36xv2IoqL
         lnxpmFl09bjq+0TOtSAOSr4C5SdZPjzbje9pD7v+SH4N9owriZsiyUxG+FfIiSqNrZk8
         XmNQ==
X-Gm-Message-State: AC+VfDzSIMLp564MwFLx04FTT/oO6BrTtTJatpCgGCT2qG114LxWF92f
	Yqzc0XKIKi3wtiO3JFm6nxwyBA==
X-Google-Smtp-Source: ACHHUZ5u3u81v97XNt8ZYi4Vn7oycEK6nytuUP7cUpqCQaWtt0YiX+WZSdz7iHa9L8Oq0akY/JCOBQ==
X-Received: by 2002:a05:6a20:7d96:b0:114:dd7d:ce0c with SMTP id v22-20020a056a207d9600b00114dd7dce0cmr1355601pzj.48.1685954606036;
        Mon, 05 Jun 2023 01:43:26 -0700 (PDT)
Message-ID: <5c3600cd-4c9f-9d1f-a807-13ed54f6b11f@bytedance.com>
Date: Mon, 5 Jun 2023 16:41:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, mst@redhat.com, stefanha@redhat.com,
 jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission



On 6/5/23 10:41, Parav Pandit wrote:
> 
> 
> On 5/4/2023 4:19 AM, zhenwei pi wrote:
>> Keyed transmission is used for message oriented communication(Ex RDMA),
>> also add virtio-blk read/write 8K example.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
> 
>> +An example of a virtio-blk write 8K request(message size: 
>> sizeof(Command) +
>> +4 * sizeof(Descriptor)):
>> +\begin{lstlisting}
>> + COMMAND            +------+
>> +                    |opcode|  ->  virtio_of_op_vring
>> +                    +------+
>> +                    |cmd id|  ->  10
>> +                    +------+
>> +                    |length|  ->  0
>> +                    +------+
>> +                    |ndesc |  ->  4
>> +                    +------+
>> +                    |rsvd  |
>> +                    +------+
>> +
>> + DESC0              +------+
>> +                    |addr  |  -> 0xffff012345670000
>> +                    +------+
>> +                    |length|  -> 16 (virtio blk write command)
>> +                    +------+
>> +                    |id    |  -> 0
>> +                    +------+
> 
> for RDMA this id is not useful. It can be omitted.
> still parsing the rest.
> 
> if we talk blk as an example, above command descriptor can be of 32 bytes,
> such as
> struct virtio_of_cmd {
>      u8 opcode;
>      u8 rsvd;
>      le16 cmd_id;
>      u8 inline_desc_cnt;
>      u8 rsvd[3];
>      /* some padding/metadata for long desc list if any */
> };
> 
> struct virtio_of_rdma_desc {
>      le64 addr;
>      le32 length;
>      le32 rdma_key;
> };
> 
> struct virtio_rdma_op {
>      struct virtio_of_cmd cmd;
>      struct virtio_of_rdma_desc desc[1 or 3]; /* count can be negotiated */
> };
> 
> With this a send and receive queue on initiator and target can exchange, 
> cmd descriptor for read/writes.
> 

Hi,

Do you mean that separating a Virtio Over RDMA queue into 2 QP, one for 
sending, another one for receiving?

> RDMA allows mapping memory and also chaining it with next send.
> This way, memory from 1B to 4GB can be represented using single rdma key 
> for data DMA (read or write).
> 
> Completion is similarly 8B with status + cmd_id of constant size can be 
> received in an RQ.
> 
> This is 1 RTT from initiator to target for cmd and response for whole 
> 4GB data transfer.
> Depending on the data size, memory pressure, sharing, outstanding 
> commands, etc target can read/write data from initiator memory using 
> RDMA read/write addresses.
> 
> With this target can also implement poll or event.
> 
> RDMA writes do not guarantee data placement visibility in same order on 
> the responder side as what is send on the requester side.
> 
> I ran out of time. Will review more later in the week.
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: 
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 

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

