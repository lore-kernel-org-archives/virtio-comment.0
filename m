Return-Path: <virtio-comment-return-8026-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6A1C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:05:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 616C92AEE2
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:05:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27C38986B23
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:05:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 02B2B986A42; Mon, 30 Oct 2023 04:05:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 450BF986A7E
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 04:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WqxINapLO56lvpj2d5fElg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698638685; x=1699243485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZK354zyYSRuQP3r6q7HeKOVcv7xc2xF/oSLrSspTlo=;
        b=ebzPIW7T5QBjyyhb6Y9+JgAyvi2QYRDAe1odYqFRNNMvzdMAkcqAAI1fqYGzQ4Zme+
         gIxo7dcTEvt9LrjddqbSUy1LrEQCQG5V4BTiiv+o9LrLV0OR36hvFjJbGBaG6aGbr7Jd
         b1gnljr0p5EShqsxq6n7cmmI996Vb1xaQqUARFmXrowZ3pk9YhKGOP8y16u7v1x5de+B
         wlq+qGcw4vUD0mQwuYtXjoL/Wutd8ZfkKpAVJx+TXlZMOMkS0XXJkgACakjcacsTAlAP
         p4Ic5KdCKAM3p4N7GpQ5mtVIm1oLFHZPCDqcAeteJSOfvNneltX0JD2greq8zAecbxRk
         NSyg==
X-Gm-Message-State: AOJu0Yz1+Z/d1WvGZcIUHWk7VCX3vOouR4imXYjnKjvW5a8lfXzR59Uc
	v8jrYGJ1wvYrez3CdEb8kAtg4iK/mcIsvp+nvTAuWJb+CCqo6R5aHad+MljOlMlCIfcc1UgX4U2
	RFGPv/fx1E5rJTsG95PKet+5OLahxLHwZ4g==
X-Received: by 2002:a05:6a00:2da4:b0:68f:fa05:b77a with SMTP id fb36-20020a056a002da400b0068ffa05b77amr7481474pfb.31.1698638685737;
        Sun, 29 Oct 2023 21:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaX1/NyyMxnr4/T3Q/52sEZjThGBbTR/QCf/S/sgAn+LxRVRq7/VFK70s+QAojYrXLAQ+NbQ==
X-Received: by 2002:a05:6a00:2da4:b0:68f:fa05:b77a with SMTP id fb36-20020a056a002da400b0068ffa05b77amr7481461pfb.31.1698638685399;
        Sun, 29 Oct 2023 21:04:45 -0700 (PDT)
Message-ID: <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com>
Date: Mon, 30 Oct 2023 12:04:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


在 2023/10/26 11:50, Parav Pandit 写道:
>> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>> open.org> On Behalf Of Jason Wang
>> For example, you still haven't succeeded in defining passthrough.
> It was defined on 19th Oct in [1].
> What part is not clear to you in definition of passthrough device?
>
> [1] https://lore.kernel.org/virtio-comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/


Let me copy-paste it again:

For example, assuming you are correct, you still fail to explain

1) what is trapped and what's not, or what's the boundary
2) if the hypervisor is not developed with those assumptions, things
can work or not

Thanks


>


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

