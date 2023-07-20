Return-Path: <virtio-comment-return-6872-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B09C001B0
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:32:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 528FD29FCF
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:32:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26623986811
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:32:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0AB799867FC; Thu, 20 Jul 2023 02:32:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB3B19867FD
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Jul 2023 02:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689820331; x=1690425131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LB4NMaDZ1RemCmgYjfrq2qrgaNOZsFIiHHb77AS1zIU=;
        b=KQhss472NaAyuCslhPGG6u3ZElrq8KBpYtCWnAQe4aGciMcsZw2/ebSoM7lMwBrVJY
         3Y8/+65ufrzLevI5TzEqIEzQGYyF1shES61T7qvudNKW36N0J2NvRIVCNW7an3Rpn4Mb
         3jFupIXM7/OtJgxGXjswgRSXQsmvNe4VdrfklLjhIWcsssYyYoYn1QkuEhNlY91JklQa
         nswacfOHABA4vHaDlcNHD5orI1qBPpnmC9ZIty9NUohnN0gg04yinL+GeMEX7SqC9f27
         iE9jgtVk5fNg7xFngZdyH/CAATHuoEcfNWciw0w9X/nRU9g+bzwUsf4xxYO8vr82zx+I
         HVCA==
X-Gm-Message-State: ABy/qLbKXeoFlQLPvsFppzw7IUX7dHayQDuzfELTrQeHnDdfc6QDPC4V
	i1ykpJjmvZzdoX23KgeXRNi9wQ==
X-Google-Smtp-Source: APBJJlFf+D2xEJCqMqphAFlOAoULzutZAyVf3/5u1bEHNPAfgxGhoQx0UdVLeaWZvgczUi6mbCP2Dg==
X-Received: by 2002:a17:903:228b:b0:1b8:3590:358a with SMTP id b11-20020a170903228b00b001b83590358amr20281973plh.19.1689820331102;
        Wed, 19 Jul 2023 19:32:11 -0700 (PDT)
Message-ID: <578f2945-3603-2e25-54f2-7ad72f402591@bytedance.com>
Date: Thu, 20 Jul 2023 10:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "stefanha@redhat.com" <stefanha@redhat.com>,
 Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <aae0b5ac-96ad-00ab-ace1-9fa2c0a15498@bytedance.com>
 <PH0PR12MB54816BDFABCC4F2D7DD9D95EDC39A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230719084646-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230719084646-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: PING: [PATCH v4 0/7] Introduce Virtio Over Fabrics



On 7/19/23 20:48, Michael S. Tsirkin wrote:
> On Wed, Jul 19, 2023 at 12:44:52PM +0000, Parav Pandit wrote:
>>
>>
>>> From: zhenwei pi <pizhenwei@bytedance.com>
>>> Sent: Wednesday, July 19, 2023 3:07 AM
>>>
>>> Hi Stefan & Parav
>>>
>>> Ping!
>>>
>>
>> This task is not in the top items for 1.4 for virtio, so had slow progress.
>> I will spend some time this month.
> 
> maybe it should be :)
> zhenwei if you are going to do something as significant as adding a new
> transport you really should join the TC as a member I think.
> 

Hi Michael

I'm excited to join the TC as a member, I have already subscribed the 
virtio-comment mailing list, should I do anything else?

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

