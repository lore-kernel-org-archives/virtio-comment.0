Return-Path: <virtio-comment-return-5630-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2DAC6FD18
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 07:23:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6F03F2B063
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 07:23:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58A4A9863E1
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 07:23:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4A2B69863D7; Tue, 25 Apr 2023 07:23:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3767E983FEA
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Apr 2023 07:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682407408; x=1684999408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J94x5nDxDjS9dFUS9i7xyVVyTjc9z/mWRA/g8SHDlAs=;
        b=jojwlyNu4hJOUBf4XwNZ8UZoM1lhuUxKeJTeiaqKaoQwKBvyPDoG+fx+y4I4NKwRYZ
         v+RPPe0GnFidQVF2CmZDoHTftrF5vw6wt+lZSOyaMtYT43Er8rqP/0/gKXdKKhaRudzY
         ClO2t1E23doAKtgerut5NwTnQ6KjHe5N/Cmwi8CNyzIjDoHZcdDD2i8TCaCCOWerPV0v
         Wt9uPfNs1elzHBGiALwoRqhf2wzXx0z3b96YqoZ2tA2AcOqiaaXPf8l6mqxGDM6FS4Cu
         7LXHlVJ6TEKYqwjUoxtvpTxs2BVSTgcvtwe0SbFRFUSlXUb7o4Ycl0NmcNTXW5k7flf5
         U0jA==
X-Gm-Message-State: AAQBX9fGN41l3V2rXO+qeoV4NM0ZwpoOh5QgeXCeJwpj3kfoGv2gIog6
	J0vpye/l7qImTu1ziWYCtpMigw==
X-Google-Smtp-Source: AKy350ZVwBl7fxgG3aWRb3vLWE9RoM6LFHbIjZcg4MAmsvE8t7u4CrD7gcbgxJJKHaGneENjsHzTBA==
X-Received: by 2002:a17:903:2094:b0:1a2:98b1:1ee2 with SMTP id d20-20020a170903209400b001a298b11ee2mr14504118plc.15.1682407408073;
        Tue, 25 Apr 2023 00:23:28 -0700 (PDT)
Message-ID: <694c448b-ca87-fde1-8d0f-5b473bdab04f@bytedance.com>
Date: Tue, 25 Apr 2023 15:21:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, parav@nvidia.com, virtio-dev@lists.oasis-open.org,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>, houp@yusur.tech
References: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
 <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com>
 <8f65c9aa-c867-0929-151c-21bbe25a0693@bytedance.com>
 <CACGkMEu9Tzrj+9CUzWOeGhRK-qONHk6cf+2RTTJtxtcKFB8cqw@mail.gmail.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <CACGkMEu9Tzrj+9CUzWOeGhRK-qONHk6cf+2RTTJtxtcKFB8cqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: Re: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)



On 4/25/23 14:36, Jason Wang wrote:
> On Mon, Apr 24, 2023 at 9:38 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>>
>>
>> On 4/24/23 11:40, Jason Wang wrote:
>>> On Sun, Apr 23, 2023 at 7:31 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> In the past years, virtio supports lots of device specifications by
>>>> PCI/MMIO/CCW. These devices work fine in the virtualization environment,
>>>> and we have a chance to support virtio device family for the
>>>> container/host scenario.
>>>
>>> PCI can work for containers for sure (or does it meet any issue like
>>> scalability?). It's better to describe what problems you met and why
>>> you choose this way to solve it.
>>>
>>> It's better to compare this with
>>>
>>> 1) hiding the fabrics details via DPU
>>> 2) vDPA
>>>
>> Hi,
>>
>> Sorry, I missed this part. "Network defined peripheral devices of virtio
>> family" is the main purpose of this proposal,
> 
> This can be achieved by either DPU or vDPA. I think the advantages is,
> if we standardize this in the spec, it avoids vendor specific
> protocol.
> 

Agree with "standardize this in the spec to avoid vendor specific 
protocol", this also avoid device specific protocol, for example, we 
don't need "block over fabrics", "crypto over fabrics", "camera over 
fabrics" ... to support virtio device family, instead we only need a 
single virtio-of.

"This can be achieved by either DPU or vDPA", do you mean case 3?

>> this allows us to use many
>> types of remote resources which are provided by virtio target.
>>
>>   From the point of my view, there are 3 cases:
>> 1, Host/container scenario. For example, host kernel connects a virtio
>> target block service, maps it as a vdx(virtio-blk) device(used by
>> Map-Reduce service which needs a fast/large size disk). The host kernel
>> also connects a virtio target crypto service, maps it as virtio crypto
>> device(used by nginx to accelarate HTTPS). And so on.
>>
>>           +----------+    +----------+       +----------+
>>           |Map-Reduce|    |   nginx  |  ...  | processes|
>>           +----------+    +----------+       +----------+
>> ------------------------------------------------------------
>> Host         |               |                  |
>> Kernel   +-------+       +-------+          +-------+
>>            | ext4  |       | LKCF  |          | HWRNG |
>>            +-------+       +-------+          +-------+
>>                |               |                  |
>>            +-------+       +-------+          +-------+
>>            |  vdx  |       |vCrypto|          | vRNG  |
>>            +-------+       +-------+          +-------+
>>                |               |                  |
>>                |           +--------+             |
>>                +---------->|TCP/RDMA|<------------+
>>                            +--------+
>>                                |
>>                            +------+
>>                            |NIC/IB|
>>                            +------+
>>                                |                      +-------------+
>>                                +--------------------->|virtio target|
>>                                                       +-------------+
>>
>> 2, Typical virtualization environment. The workloads run in a guest, and
>> QEMU handles virtio-pci(or MMIO), and forwards requests to target.
>>           +----------+    +----------+       +----------+
>>           |Map-Reduce|    |   nginx  |  ...  | processes|
>>           +----------+    +----------+       +----------+
>> ------------------------------------------------------------
>> Guest        |               |                  |
>> Kernel   +-------+       +-------+          +-------+
>>            | ext4  |       | LKCF  |          | HWRNG |
>>            +-------+       +-------+          +-------+
>>                |               |                  |
>>            +-------+       +-------+          +-------+
>>            |  vdx  |       |vCrypto|          | vRNG  |
>>            +-------+       +-------+          +-------+
>>                |               |                  |
>> PCI --------------------------------------------------------
>>                                |
>> QEMU                 +--------------+
>>                        |virtio backend|
>>                        +--------------+
>>                                |
>>                            +------+
>>                            |NIC/IB|
>>                            +------+
>>                                |                      +-------------+
>>                                +--------------------->|virtio target|
>>                                                       +-------------+
>>
> 
> So it's the job of the Qemu to do the translation from virtqueue to packet here?
> 

Yes. QEMU pops request from virtqueue backend, translates it into 
virtio-of, and forwards to target side. Handle response from target 
side, then interrupt guest.

>> 3, SmartNIC/DPU/vDPA environment. It's possible to convert virtio-pci
>> request to virtio-of request by hardware, and forward request to virtio
>> target directly.
>>           +----------+    +----------+       +----------+
>>           |Map-Reduce|    |   nginx  |  ...  | processes|
>>           +----------+    +----------+       +----------+
>> ------------------------------------------------------------
>> Host         |               |                  |
>> Kernel   +-------+       +-------+          +-------+
>>            | ext4  |       | LKCF  |          | HWRNG |
>>            +-------+       +-------+          +-------+
>>                |               |                  |
>>            +-------+       +-------+          +-------+
>>            |  vdx  |       |vCrypto|          | vRNG  |
>>            +-------+       +-------+          +-------+
>>                |               |                  |
>> PCI --------------------------------------------------------
>>                                |
>> SmartNIC             +---------------+
>>                        |virtio HW queue|
>>                        +---------------+
>>                                |
>>                            +------+
>>                            |NIC/IB|
>>                            +------+
>>                                |                      +-------------+
>>                                +--------------------->|virtio target|
>>                                                       +-------------+
>>
>>>>
>>>> - Theory
>>>> "Virtio Over Fabrics" aims at "reuse virtio device specifications", and
>>>> provides network defined peripheral devices.
>>>> And this protocol also could be used in virtualization environment,
>>>> typically hypervisor(or vhost-user process) handles request from virtio
>>>> PCI/MMIO/CCW, remaps request and forwards to target by fabrics.
>>>
>>> This requires meditation in the datapath, isn't it?
>>>
>>>>
>>>> - Protocol
>>>> The detail protocol definition see:
>>>> https://github.com/pizhenwei/linux/blob/virtio-of-github/include/uapi/linux/virtio_of.h
>>>
>>> I'd say a RFC patch for virtio spec is more suitable than the codes.
>>>
>>
>> OK. I'll send a RFC patch for virtio spec later if this proposal is
>> acceptable.
> 
> Well, I think we need to have an RFC first to know if it is acceptable or not.
> 

Sure, I'll send a draft.

>>
>> [...]
>>
>>>
>>> A quick glance at the code told me it's a mediation layer that convert
>>> descriptors in the vring to the fabric specific packet. This is the
>>> vDPA way.
>>>
>>> If we agree virtio of fabic is useful, we need invent facilities to
>>> allow building packet directly without bothering the virtqueue (the
>>> API is layout independent anyhow).
>>>
>>> Thanks
>>>
>>
>> This code describes the case 1[Host/container scenario], also proves
>> this case works.
>> Create a virtqueue in the virtio fabric module, also emulate a
>> "virtqueue backend" here, when uplayer kicks vring, the "backend" gets
>> notified and builds packet to TCP/RDMA.
> 
> In this case, it won't perform good. Since it still use virtqueue
> which is unnecessary in the datapath for fabric.
>  > Thanks
> 
>>
>> [...]
>>
>> --
>> zhenwei pi
>>
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

