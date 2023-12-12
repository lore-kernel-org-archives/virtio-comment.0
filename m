Return-Path: <virtio-comment-return-8784-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF4BC4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 09:24:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C04932354A
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 09:24:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA1A198669B
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 09:24:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD154983FE6; Tue, 12 Dec 2023 09:24:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F7C5986556
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Dec 2023 09:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373080; x=1702977880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAi5ycmI6jCc0CZlDM4Z/ceW1VbrV3VM/85QE3RXx9I=;
        b=eqMm5N4Vtcg/+iaEfc5Cf/k80qGwHX7qA3VMDrWTuniTf7nBUTRZm/9rxmT7v9p0Zb
         mqyMNG0a8jby+yEUI/XV4Ye1b+7cIUgsnofKRUzJmXIa4AYrVZHV8SfUlogzPwqS5OGB
         GXO0Z6lzAOhZ5LgeIkjsszJkloiWY/mnX1j6sdGa0F/H+XjJijSsp8hx64j0etdHrhJm
         LOQnI9RIfnsGJlwD9hwab4AkTTb9E63G+TdRCWI/QGJ6HjfImUjs2F290MmAKUB2Vf1Z
         ZCEOBREFoUYTiDF6NeS4G92ISztehipJaBmHgnKCnd2R4wOZFYOgFirVvARXu3u9RX+t
         hqFQ==
X-Gm-Message-State: AOJu0Ywvwc3TgRCOTcfZSmG6szOw/HxlzB270VbigmxMfqYue8h+4Kx/
	ZBbpCG8NIcmSxNm9+eT+WYHZRg==
X-Google-Smtp-Source: AGHT+IEJGseiUjGmHoV/MIpR2l2f2f3sYqQ7IgP5Ct8m2xIamJhRku3Nl20v6m2JqUmVSslGxpCa/Q==
X-Received: by 2002:a05:6808:15a9:b0:3b6:a8f8:fa0d with SMTP id t41-20020a05680815a900b003b6a8f8fa0dmr7429774oiw.15.1702373079914;
        Tue, 12 Dec 2023 01:24:39 -0800 (PST)
Message-ID: <61d180ed-d4c2-4764-aea4-f8ac5fa0c007@bytedance.com>
Date: Tue, 12 Dec 2023 17:19:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "parav@nvidia.com"
 <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
 <20231023104647.290759-4-pizhenwei@bytedance.com>
 <EA77A282-0A38-4B97-B6BC-34449CDEAC9D@nutanix.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <EA77A282-0A38-4B97-B6BC-34449CDEAC9D@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: Re: [PATCH v5 3/7] transport-fabrics: introduce Virtio-oF
 Protocol Data Unit



On 12/12/23 14:22, Raphael Norwitz wrote:
> One suggestion I didn’t think of in my prior review.
> 
>> On Oct 23, 2023, at 6:46 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> Introduce Virtio-oF PDU for Virtio-oF queue, add Stream Data Transfers
>> and Keyed Data Transfers mechanism.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> —
> <snip>
>> +\begin{lstlisting}
>> +struct virtio_of_keyed_desc {
>> +        /* the remote address of data */
>> +        le64 addr;
>> +        /* the length of data */
>> +        le32 length;
>> +        /* the key to access the remote data */
>> +        le32 key;
>> +};
>> +\end{lstlisting}
> 
> Going off my comment here: https://lists.oasis-open.org/archives/virtio-comment/202307/msg00253.html
> 
> You could probably save some space space in virtio_of_keyed_desc with a protocol extension where you can pre-register some number of MRs/keys with the target and reference them by index.  For example, you could save 16 bits per descriptor, lowering the total memory footprint by 1/8 by doing something like:
> 
> struct virtio_of_small_keyed_desc {
>          /* the remote address of data */
>          le64 addr;
>          /* the length of data */
>          le32 length;
>          /* the mr_id which maps to a key (and possibly a base address) on the target size */
>          le16 mr_hint;
> };
> 
> If you could bound the size of each MR (to, say 4GB) it could make sense to send a 32 bit offset into the MR and then re-compute the address on the target side.
> 

In my imagination, for example, the target reports the max Keyed desc as 4:
1, the initiator side has less segments(Ex, 3), the initiator just sends 
3 Keyed desc.
2, the initiator side has more segments(Ex, 6), the initiator side has 
to allocate a large memory, copy the suitable segments to the allocated 
memory(or copy from).
Ex, OUT[0] 16B, OUT[1] 4K, OUT[2] 4K, OUT[3] 16K, OUT[4] 8K, IN[5] 1B
then the initiator side needs allocate 8193 memory, copies OUT[0], 
OUT[1] and OUT[2] into new memory, finally sends 4 Keyed desc.

 From my knowledge, most virtio devices usually use fixed segments(not a 
hard limitation), virtio-blk also reports max_seg in config. So I 
suppose the target side could report reasonable value to avoid memory copy.

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

