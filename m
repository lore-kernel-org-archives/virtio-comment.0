Return-Path: <virtio-comment-return-8781-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3708C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 08:41:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 016221395F9
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 08:41:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6AF5986637
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Dec 2023 08:41:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B77C0983FE6; Tue, 12 Dec 2023 08:41:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5AD3986556
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Dec 2023 08:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702370511; x=1702975311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTfg4pFYq73kjOFQ/Znwn+3uASeFODy+sxxPWPfEbc4=;
        b=QI14a7E49GrmZBHa2RsunofybShPdz/X62RS2CX5UmYchYiwlKH8uPcS8yg34ifQgo
         t6dsOYN7yqXDSWiy5F+ta2ekCtH0f65/FJIUX1Ks3hbKVTunQRuFTBM8imqCi/3ga2zv
         WHp88Aaxval55Goq3IedDy/9yvjoYrJsehuyoWAdWHZxkwTzNwQDg+BqzJlshczbbOdc
         c1DrtVSXdXKCowp3uYXGWo2g9Q88SZs0R1X1Xqm+7H5e1gD6dF//93AcC/YyHsosOFXd
         ViEC7OczSA/QMR9KLtKHmF5i6Hq3TiYr3VOtsoUpvxDwlC1CcHF9+/fmWApxCEaVMBa1
         zNsg==
X-Gm-Message-State: AOJu0YzEJwhAWoE+IG1jBKMULbFoSGEw+Fl+VtlFLaNqQfWD/DsYyGIS
	Vk99MKOBcA1hd9/r9AhO0x7OcA==
X-Google-Smtp-Source: AGHT+IE54WLUye4d89V66t/Skd/oa6T2I5LGmvzsWqtDXBRYMf6czhYQQ47lXE5AjYe4k6AnhghnfA==
X-Received: by 2002:a17:90a:bb10:b0:28a:b60d:da43 with SMTP id u16-20020a17090abb1000b0028ab60dda43mr487425pjr.0.1702370511034;
        Tue, 12 Dec 2023 00:41:51 -0800 (PST)
Message-ID: <b8a82667-ab11-4eb4-acf7-0709839ba04f@bytedance.com>
Date: Tue, 12 Dec 2023 16:36:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "mst@redhat.com" <mst@redhat.com>, "parav@nvidia.com" <parav@nvidia.com>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
 <2e46e50d-62b2-41f7-82e0-66b3ecf71bae@bytedance.com>
 <527CF341-5AB7-40EB-8A58-722672301B27@nutanix.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <527CF341-5AB7-40EB-8A58-722672301B27@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: [PATCH v5 0/7] Introduce Virtio Over Fabrics



On 12/12/23 14:23, Raphael Norwitz wrote:
> 
> 
>> On Nov 16, 2023, at 10:43 PM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> Hi Stefan & Raphael,
>>
> <snip>
>>
>> There is limitation for multi-path, because one TCP or RDMA connection per VQ in current version. what about adding a new concept --- path?
>> A virtio-of device instance has one or more virtio-of path, a virtio-of path contains a control queue and several VQ.
> 
> Apologies for the late reply here.
> 
> Sounds reasonable to me. I had wondered why you had put one connection per virtio-of VQ as a fundamental limitation in the first place.

Hi Raphael,

Because the original version does not contains 'multi-path' support :)

Once the above one is reasonable, I'll remove 'one connection per 
virtio-of VQ as a fundamental limitation in the first place' in the next 
version.

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

