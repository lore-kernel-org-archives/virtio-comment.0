Return-Path: <virtio-comment-return-8038-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C530C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:35:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 97C4A2AEEF
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:35:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BF2E986B39
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:35:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41C37986B2C; Mon, 30 Oct 2023 11:35:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB8EC986B2D
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 11:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: TudyI1ADPeOcpAdJcGgKuQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698665696; x=1699270496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwpLH2bvPopiWcVrTHoL7LNKkXfPNoq0S3urKTpcqLw=;
        b=q47MieC74YaeY2Q7Hs6kU1cvohxwnQsNcwynEs5Z1UIo3i6GFENnpW5cAxCMgTuxdG
         jcoz1xY7lu2icJgN+CP09FHK3Lzz+SPikiA6pgeST/tcav/BjN8Kla0d59w3SJq0MlVo
         t7qpEoSGQBnl4Pr7npIXlKkmEenVURkJ4fj6spehq0Mbbk7nPteIHfnaCbaILoLlmAZ1
         hMWKETavjsZj5la5aGTnLO4wxMpVExrgOtvGWSdo7IFzpJiRMLHA0D/qX7/nwxE6zmZY
         Oezg/wMmef1QKbD6gq4WLtbl07q9MiGrM/esxbgZb2wucwTKS0Z4aCQGl9NbM53JEUbE
         VYvQ==
X-Gm-Message-State: AOJu0Yz0pbkvk8gqSNECrzk9FG/KN1OfZDR6kdcgB1cDmtw1cjTjvscY
	ymyXDfZOVSkPbli3/1LYz6m9IXRHXq3vdsou3pKDrCR4dX6sG9Q1y9bQjMi5q+Q8JtTRixnQYUK
	xq/fvAJ7U+CbbRJZ7O8HiklYRacNr7YVcpA==
X-Received: by 2002:adf:d1ed:0:b0:32f:810e:8a3f with SMTP id g13-20020adfd1ed000000b0032f810e8a3fmr3943328wrd.14.1698665696561;
        Mon, 30 Oct 2023 04:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/nuRp9tw4nbvTBxkmLML6gKJIeo/Sj77RSi1Cg5FqLAN2k/dl4gaZs/GTz019qMbo6EKFZw==
X-Received: by 2002:adf:d1ed:0:b0:32f:810e:8a3f with SMTP id g13-20020adfd1ed000000b0032f810e8a3fmr3943311wrd.14.1698665696270;
        Mon, 30 Oct 2023 04:34:56 -0700 (PDT)
Date: Mon, 30 Oct 2023 07:34:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231030072937-mutt-send-email-mst@kernel.org>
References: <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Mon, Oct 30, 2023 at 10:23:14AM +0000, Parav Pandit wrote:
> > And the helper driver could be considered as a part of the hypervisor, or the
> > guest vCPU can not access the host side devices.
> > 
> > For example, the path is hw-->vfio_pci-->qemu-->guest. IT IS NOT hw-->guest.

I think above makes sense. Nvidia decided to standardize on VFIO and
that's ok, but there's no point in calling specifically VFIO "true
passthrough" or whatever the marketing term du jour is. This is
not a VFIO TC here. I do wish one of the sides in this discussion
stopped promoting their architecture and the one true way and
tried to actually build interfaces addressing multiple architectures,
though. Otherwise we'll keep getting stuck.

> In virtio spec we only talk about the driver, and the device in context of passthrough device.
> So for virtio common config, dev config, cvq, data vqs are guest driver -> device.
> There is no other entity inbetween.

No longer true - with admin commands we have 2 devices: owner and
member, and each has its own driver.

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

