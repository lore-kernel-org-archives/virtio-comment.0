Return-Path: <virtio-comment-return-6149-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B69FC77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 03:15:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 897CC3356A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 03:15:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7583798649D
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 03:15:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5DD3398590A; Tue,  6 Jun 2023 03:15:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A1BA986488
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 03:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686021314; x=1688613314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22huibJASxWRYFH/cd64VMsvxhtmBQfqCcrBTn/+CXE=;
        b=Fyh/mlG3kdL0YuwOaTJg4VfsG4Nju9WB69GgFLDuqZcMkr9YRTmYVD16DlM2Z1xyT9
         N0IXB4GSGWzIdRasKHxkMGu9crNRWxJNoLBsgrLnQQvZX7B8uGJUK7qFUFLjc6EhmoNT
         kybXzYQJ5jUa0td16HZnYxCUoSPN34S8UQRz7R7cDWL5xN6Qc8PjjcJlj/henviy7Scj
         Seu8545d0p0o9VOSzX1uHt3anRv6SS/xK2fghA74xeP0P62+gMVf3sxT4WJRmo+FwUNy
         wQdzABUPAA9RPoZ0RvQCGLVnWf/f/Wi/6RBwX8auw6XTGe4SaW04//Tyl/5FuW9G5CYN
         0i9w==
X-Gm-Message-State: AC+VfDyPjqVfu833EIGavJUyGsLXnPZZ3Al30Myha9IA9jFDnIm/5hjj
	4paMwicLRoM1ZcQ8690D6dApCg==
X-Google-Smtp-Source: ACHHUZ7ypZ2QCc5X9aKN2KLsu9n4AhO4fUPcmiv3SDuJGeJSGTG/QUK7kuIRsY29DkZWgh397R9XbA==
X-Received: by 2002:a05:6a00:2403:b0:652:7b99:df30 with SMTP id z3-20020a056a00240300b006527b99df30mr653406pfh.25.1686021314412;
        Mon, 05 Jun 2023 20:15:14 -0700 (PDT)
Message-ID: <db292e92-a5ad-bb40-1148-d43463431b25@bytedance.com>
Date: Tue, 6 Jun 2023 11:13:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-5-pizhenwei@bytedance.com>
 <20230531152059.GF1248296@fedora>
 <c4621ae5-a677-8ecf-1b80-f598069cc0d4@bytedance.com>
 <20230605161143.GA1624556@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230605161143.GA1624556@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: Re: [virtio-comment] [PATCH v2 04/11] transport-fabrics:
 introduce Stream Transmission

On 6/6/23 00:11, Stefan Hajnoczi wrote:
> On Fri, Jun 02, 2023 at 10:26:48AM +0800, zhenwei pi wrote:
>> On 5/31/23 23:20, Stefan Hajnoczi wrote:
>>> On Thu, May 04, 2023 at 04:19:03PM +0800, zhenwei pi wrote:
>>>> +                  | +------+
>>>> +                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
>>>> +                  | +------+
>>>> +                  |
>>>> + DATA             |>+------+  -> 0
>>>> +                    |......|
>>>> +                    +------+  -> 1
>>>> +\end{lstlisting}
>>>
>>> I think this is more flexible (and has more protocol overhead) than
>>> necessary. When the device has used a virtqueue buffer, it indicates how
>>> many bytes were used (this can be less than the totaly number of F_WRITE
>>> bytes available). I don't think there is a need to communicate F_WRITE
>>> descriptors, especially in the Completion. Just a Completion with a
>>> 'length' field instead of an 'ndesc' field followed by data is enough.
>>>
>>
>> I guest this is not enough. For example, a initiator want to read 3 desc:
>> desc0[n bytes], desc1[m bytes], desc2[1 byte]. desc[2] is expected to read a
>> u8 status.
>>
>> the target fills desc0[n - x bytes], desc1[m - y bytes], desc2[1 byte], the
>> 'length' is (n - x + m - y + 1), we should decode each descriptor and fill
>> the driver buffer correctly.(otherwise, if x + y > 0, desc[2] is never
>> filled)
> 
> No, the framing really doesn't matter - that's what the spec says, after
> all. The framing could be [n, m, 1] like in your example or [1, 1, n-2,
> m-1, 1, 1], both are valid. What matters is that the device knows at
> which offset the 1-byte status field must be written.
> 
> It is the VIRTIO specification that determines how to find the offset,
> not the framing of the virtqueue buffer elements. (Again, the spec
> explicitly forbids depending on framing.)
> 
> In other words, the virtio-blk spec says that the status byte is the
> last writeable byte and that's how the device knows the offset. The
> framing doesn't matter.
> 
>>> Since VIRTIO has flexible framing
>>> (https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-390004),
>>> there isn't really a need to communicate the F_WRITE descriptors at all,
>>> just the maximum number of used bytes that the initiator expects.
>>>
>>> Can you explain why you chose to transmit F_WRITE descriptors in both
>>> the Command and the Completion? Maybe I missed a reason why it's
>>> important.
>>
>> Just keep the flags same to the descriptor from the command, give the
>> initiator a hint 'this is a read descriptor'.
> 
> Sending virtqueue element information across the wire seems inefficient
> to me. I think the protocol can be optimized for stream (TCP) and keyed
> (RDMA) fabrics by omitting aspects that are not strictly needed.
> 
> Stefan

Got it, thanks! By the way, for both command and completion, the 
descriptors are not necessary? A command like:
struct virtio_of_command_vq {
         le16 opcode;
         le16 command_id;
         le32 out_length;
         le32 in_length;
         u8 rsvd[4];
};

This seems enough ...

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

