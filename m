Return-Path: <virtio-comment-return-7950-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB022C25B47
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 08:30:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 03A672AEEA
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 08:30:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE1AA9869EA
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 08:30:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9D3F79869E0; Wed, 25 Oct 2023 08:30:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7F1049869E2
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 08:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DeMhOX0cMhOO5_EfblDZ8w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222293; x=1698827093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYH+1p3VJIZPjuWRCUo7OKdWnxdGNiP7oQsw8fHM7zw=;
        b=IrX1gKCtM5UOzOQnguw8Qxu++QLzWxHoNUZ3AovaFTZKIrCKfrGFiFa0NckAwJqDB9
         aZKvesdEsFSk455f5kCY1BUSElgpVr12DJJmfzcpK33wFAk3YLkGS5+RSnpmJWxwqKX8
         nw2IuMEDIeLNyBQgYuxikzKDvVvAU9dXvriDm/EoUbKePaaiw0URz6NhF0z1wubgFUkM
         0epOW+E+4iKs6nmggVk8I1Dn5RkbrFq5ybw9EEoJ2KxugqG+RyryjEIPxovsI/747jUE
         gx1REGDkZuccJdRXwu6Zc7GrH8Sp7vp+YBLbjFSx0AlIwaAbRvSa5j9tIjk5mF9mi6XI
         NJdg==
X-Gm-Message-State: AOJu0Yzk4AoRAo1TtAfWHoYpT6ByZ6q4TmpF6434bJ77yPaZULXBYrsm
	o/1U8vl66mjnkjOKpiO1qlA6dqrmyoX9aRBU6tPyvSlFwrnZl10zTLMNfqF8OdbrniNBw3HPew8
	c3FybMi9ZUyrCNrbGRGWnq3a7q+VUAn9/9w==
X-Received: by 2002:adf:e40f:0:b0:32d:81b5:82d0 with SMTP id g15-20020adfe40f000000b0032d81b582d0mr9453305wrm.33.1698222293590;
        Wed, 25 Oct 2023 01:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGki98enZShq23eUMErhSFI7CBYTHg3S4H+qWjfiGHaWYoQHtXsYRnakm7+G2snrsL6wVzHMw==
X-Received: by 2002:adf:e40f:0:b0:32d:81b5:82d0 with SMTP id g15-20020adfe40f000000b0032d81b582d0mr9453291wrm.33.1698222293241;
        Wed, 25 Oct 2023 01:24:53 -0700 (PDT)
Date: Wed, 25 Oct 2023 04:24:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231025041653-mutt-send-email-mst@kernel.org>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 25, 2023 at 07:15:24AM +0000, Parav Pandit wrote:
> Treating all registers equally and synchronizing it in the device is better model to not bifurcate the device.

Glad you like it, though I don't think many hypervisors treat all
registers equally. Personally I think where does the ideal balance pass
depends on specific hardware and software. And it is not wise to
tie ourselves to specific needs du jour.

So can we please stop arguing about which model is better on this list and
instead focus on building reusable components that different devices can
use as they see fit?

-- 
MST


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

