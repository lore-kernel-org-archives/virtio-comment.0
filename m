Return-Path: <virtio-comment-return-8057-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD12C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 07:45:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5AE432AEF3
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 07:45:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28410986B6D
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 07:45:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 081EC986B65; Tue, 31 Oct 2023 07:45:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7A6D986B66
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 07:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: t_fnw_ueNz2dNt35k7PFZA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698738304; x=1699343104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GEIDfwkRQz2WsV23/qfDjrvOdKdBPpQnHSDpvn3fhDM=;
        b=P7a6unt7V1wLGrqnt7tfp+BvA40xKKzn/NZDvTEE0NBrTWWOjoYRbhwMexE1pKBlMs
         kDLK3OxZdxLOzdCQ1czDVdn+uID6A2QuOz885VcHLnpzcipV7jIf9G5gffdWMXxzeyJS
         25fYbe792J0YwbIJOErMb6O+u7vHI1yz73a/JFFVxRxo8+0T4cQoQ8V/ArlCnEmnXEuB
         sYhYyoAymCL5TyjG8WalXw56sdu5F5K9c8Og0sNouxPbc/mjmZMYm5k2EpPjITepQ1oh
         S3LqMIO6Y+6A3HylZGqOPL32FO9982l86VzFgMgzFK+arH2crv2nEW+E0q22VvBMz+m2
         SFXA==
X-Gm-Message-State: AOJu0YwRRXUNrDyRYKo9PBpVi/zdVg4E0oNstvf908cZiXPVhxQuNqfh
	pxeDXmiD5PDWQLJnjfae1OqHMqAcuHNaemOeIzv7+zfqpi+X9Hnp2xgf/kCu8FFQuiwna6aqcNE
	6DrUEYWOTMZon5Twf9rBeVBTogj5NYOb2/g==
X-Received: by 2002:a05:6000:4014:b0:32f:7502:fba9 with SMTP id cp20-20020a056000401400b0032f7502fba9mr2070879wrb.1.1698738304560;
        Tue, 31 Oct 2023 00:45:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqxH+BxhOr2qLNKAYXtcZPSycsnLVzyXRXQaVBt+iSq13u9RzwGW5HkbRia3ndXi034WHp9A==
X-Received: by 2002:a05:6000:4014:b0:32f:7502:fba9 with SMTP id cp20-20020a056000401400b0032f7502fba9mr2070856wrb.1.1698738304148;
        Tue, 31 Oct 2023 00:45:04 -0700 (PDT)
Date: Tue, 31 Oct 2023 03:45:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231031034117-mutt-send-email-mst@kernel.org>
References: <20231030131959.1386107-1-parav@nvidia.com>
 <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Tue, Oct 31, 2023 at 03:27:12AM +0000, Parav Pandit wrote:
> 
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 31, 2023 7:13 AM
> > 
> > On Mon, Oct 30, 2023 at 9:21 PM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > During a device migration flow (typically in a precopy phase of the
> > > live migration), a device may write to the guest memory. Some
> > > iommu/hypervisor may not be able to track these written pages.
> > > These pages to be migrated from source to destination hypervisor.
> > >
> > > A device which writes to these pages, provides the page address record
> > > of the to the owner device. The owner device starts write recording
> > > for the device and queries all the page addresses written by the
> > > device.
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > > ---
> > > changelog:
> > > v1->v2:
> > > - addressed comments from Michael
> > > - replaced iova with physical address
> > > ---
> > >  admin-cmds-device-migration.tex | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/admin-cmds-device-migration.tex
> > > b/admin-cmds-device-migration.tex index ed911e4..2e32f2c 100644
> > > --- a/admin-cmds-device-migration.tex
> > > +++ b/admin-cmds-device-migration.tex
> > > @@ -95,6 +95,21 @@ \subsubsection{Device Migration}\label{sec:Basic
> > > Facilities of a Virtio Device /  The owner driver can discard any
> > > partially read or written device context when  any of the device migration flow
> > should be aborted.
> > >
> > > +During the device migration flow, a passthrough device may write data
> > > +to the guest virtual machine's memory, a source hypervisor needs to
> > > +keep track of these written memory to migrate such memory to destination
> > hypervisor.
> > > +Some systems may not be able to keep track of such memory write
> > > +addresses at hypervisor level. In such a scenario, a device records
> > > +and reports these written memory addresses to the owner device. The
> > > +owner driver enables write recording for one or more physical address
> > > +ranges per device during device migration flow. The owner driver
> > > +periodically queries these written physical address records from the device.
> > 
> > I wonder how PA works in this case. Device uses untranslated requests so it can
> > only see IOVA. We can't mandate ATS anyhow.
> Michael suggested to keep the language uniform as PA as this is ultimately what the guest driver is supplying during vq creation and in posting buffers as physical address.


Yes the spec calls the address accessed by the device "physical
address". Granted, this is pointless - there is only one
type of address device can access. We can if we want to
replace that with just "address" or "memory address".
I don't think this ever caused confusion though and worth the
churn.


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

