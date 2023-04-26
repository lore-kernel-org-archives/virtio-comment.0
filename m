Return-Path: <virtio-comment-return-5649-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6410C77B61
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 01:10:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BF807370F3
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 01:10:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B440398663C
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 01:10:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A9815983D70; Wed, 26 Apr 2023 01:10:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92B469864A2
	for <virtio-comment@lists.oasis-open.org>; Wed, 26 Apr 2023 01:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682471439; x=1685063439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Y2xhbCB7IK3bWtyX0TORtIxAgsTf+zaJodL0cvexKU=;
        b=GmdgXg25+GwfG0uMA/ZKzc3R3MsTBAy8haERIvq1fe440WE4hSk6cBZIQ8sel0obUa
         q/FV+cXVov+UF8uU3H0C7/xaYDDiA3eZ1y+znCzvATxDNWieMYkJVZsEmUVImCLvby5c
         Cv5NlDfdLr2/apWM1RoTGDiPjf5vsoyRTbsRBpcPBakn0BeOiOJu1DtJNKUBl+3S8Rho
         tCi+zDAUhLlWHenaOFyWwy4NENLVbO61C6by461l2sfCfOY6zsnPNCGlqDPYtezquUxE
         sJnbIe7zWgS46mrAZlaRl4bGjqyLDUc4e2MbdzStxXLqmXPcYGRrexPnHbmfYTSzVTTb
         wrQQ==
X-Gm-Message-State: AAQBX9cCxHIaKC29YbvZ67fl3i89QR3IgD9nHc0JMuSRpLY8/hxHcW0B
	yKjwlsLBM+Iex+F0hv2x5SWyTA==
X-Google-Smtp-Source: AKy350b2sKfgGDS2Q71daTN1CJL8RCzQNPNoiixdjHyOCJzGbnNci7m8HvsWaPRZu9F8BZE2ftK4Qw==
X-Received: by 2002:a17:90a:bd94:b0:249:842d:312f with SMTP id z20-20020a17090abd9400b00249842d312fmr19166295pjr.4.1682471438903;
        Tue, 25 Apr 2023 18:10:38 -0700 (PDT)
Message-ID: <63d20b11-e6e8-7f9e-5cbd-be2a506115c6@bytedance.com>
Date: Wed, 26 Apr 2023 09:08:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, parav@nvidia.com, virtio-dev@lists.oasis-open.org,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>, houp@yusur.tech
References: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
 <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com>
 <20230425135532.GA697094@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230425135532.GA697094@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)



On 4/25/23 21:55, Stefan Hajnoczi wrote:
> On Mon, Apr 24, 2023 at 11:40:02AM +0800, Jason Wang wrote:
>> On Sun, Apr 23, 2023 at 7:31 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>> "Virtio Over Fabrics" aims at "reuse virtio device specifications", and
>>> provides network defined peripheral devices.
>>> And this protocol also could be used in virtualization environment,
>>> typically hypervisor(or vhost-user process) handles request from virtio
>>> PCI/MMIO/CCW, remaps request and forwards to target by fabrics.
>>
>> This requires meditation in the datapath, isn't it?
>>
>>>
>>> - Protocol
>>> The detail protocol definition see:
>>> https://github.com/pizhenwei/linux/blob/virtio-of-github/include/uapi/linux/virtio_of.h
>>
>> I'd say a RFC patch for virtio spec is more suitable than the codes.
> 
> VIRTIO over TCP has long been anticipated but so far no one posted an
> implementation. There are probably mentions of it from 10+ years ago.
> I'm excited to see this!
> 
> Both the VIRTIO spec and the Linux drivers provide an abstraction that
> allows fabrics (e.g. TCP) to fit in as a VIRTIO Transport. vrings are
> not the only way to implement virtqueues.
> 
> Many VIRTIO devices will work fine over a message passing transport like
> TCP. A few devices like the balloon device may not make sense. Shared
> Memory Regions won't work.
> 

Fully agree.

> Please define VIRTIO over Fabrics as a Transport in the VIRTIO spec so
> that the integration with the VIRTIO device model is seamless. I look
> forward to discussing spec patches.
> 
> Stefan

Thanks, I'm working on it.

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

