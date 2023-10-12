Return-Path: <virtio-comment-return-7690-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3F3CDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:17:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8CCE98508F
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:17:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 630D798683D
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:17:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4728F986474; Thu, 12 Oct 2023 11:17:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 374E898660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 11:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kjvIIUnPMwaWa0EPbtg5GQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697109464; x=1697714264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5DQ3RtuYLGbwlRfz4Iqa3ZqZTgc1xk72GaSIL7R6uc=;
        b=wuHJjJIYvhtfSWf79s+sZuDYuW4iGHYOlGqvdUmS+ao9TJ8gP5qgw6WIjVctic/AMU
         xoJvnWXzGKFXYcF/Dy01mAdiAhqNcWL97CiWsVAvAYvFz4GtntI6Ofm6DRo31qtUAL/R
         Otg5MoZsK5a1iX4sM9b/8Z4ELkwn+dZCbCEuXuVjdzJ7uDDlJVCdvf8/OzRc8FNYiUB0
         sVk+AkrssICluPiugci4BjuU/UgeK5b/j2y13wZjhREcty3Y5yn50mt4fRf1lHiOUSlg
         ZI74DTWbWluB74x0Sl4/Cy2Yq8HDJIEHzxwF6m91pknihGCGo+tKA8ARNSjYiHy+h2RQ
         nQPg==
X-Gm-Message-State: AOJu0YyOVOHf5JiIs+ZjucVBOxgLcY9P6KyN6uId8BgfZSvDXNX5Wzlr
	rJTwneLxqymSnM8KUeputu4QGPc+nTnF+3/fvDQzKFGxwQT9ucyCwsdep+zYXqEJjbHzOwLD+YN
	yMaeom15ytXVpumhiq6q0R9T5FhhmoPRd8g==
X-Received: by 2002:a1c:7419:0:b0:406:7d74:a2a6 with SMTP id p25-20020a1c7419000000b004067d74a2a6mr21324947wmc.24.1697109463897;
        Thu, 12 Oct 2023 04:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY4qTLNAgfCOKU4Wy9NPnaFjtxbjprJLFwy4g7RdhilOnhXYw3d1MHRLo/Li96KIm96bLgBw==
X-Received: by 2002:a1c:7419:0:b0:406:7d74:a2a6 with SMTP id p25-20020a1c7419000000b004067d74a2a6mr21324934wmc.24.1697109463598;
        Thu, 12 Oct 2023 04:17:43 -0700 (PDT)
Date: Thu, 12 Oct 2023 07:17:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231012071355-mutt-send-email-mst@kernel.org>
References: <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 12, 2023 at 10:58:14AM +0000, Parav Pandit wrote:
> Sure, as I explained the config register method do not work for passthrough mode, and does not scale.

And on the flip side, to be frank not everyone has huge guests and
numbers of VMs and a slower memory mapped interface for small devices
might make sense.  What we need to do though is make this a small
non-intrusive part since it's not clear such embedded cases even need
live migration.


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

