Return-Path: <virtio-comment-return-8608-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24425C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 08:51:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 528592B01B
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 08:51:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 268A39868B0
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 08:51:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 09D909862D9; Fri, 24 Nov 2023 08:51:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE1449868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gTIEOetMNIuvbnjGQ1B5TQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815862; x=1701420662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5MPJhnTCrm5AopSUuzYwBr0b9antMwqizB171teFaY=;
        b=lo46YKhWe37e9zwfbX2e/w94jW3OTVgh8b1kt08Ks/pgFHjDw4zaAwpFs+fwESGg78
         hc3OJExk3Mtj+RTRxQyL108hR+Nhi3n/bkCmq67iZcvOPDfUGa6HjydI1vnmMJ5/tYIT
         2hAcRDbGhdVe4wOj74/gkqH6ih/PjX4p2fiIKgDf8kBCuiA2NjTA8SXbJW7AiBNtnR8w
         yedPoD0Z1lnRLp2S740i/d+vxi6cWxefCmoXcn7OmbO/ulBtendzcg0B4njcRZyoJQAI
         wCqBpwDBK0jKlFSaAHn9jeWoCjBEmHLq6Asu7iTBZHTAj1CSrlO5eEPQVFFE7tu+Kwpi
         mKtw==
X-Gm-Message-State: AOJu0Yyn1yy4pj4xy7hztmksnaEkBX8JocXN9yRbF6YRiMPOmGL8zBlK
	Jx/8Nx1IDsbbQ3q5g+1N8MiwmQqf3vGXdIJBaUGHooIzPAy/LIY/A/U/1K2AuzUAEd8hVsPG42f
	sTmFTXxYb6QYH4y6g3hufJuD2sCVXWrjb5g==
X-Received: by 2002:a50:a412:0:b0:543:f08:fdc with SMTP id u18-20020a50a412000000b005430f080fdcmr1487549edb.9.1700815862301;
        Fri, 24 Nov 2023 00:51:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQYfzd2Apgnq9NEBstWvNQXdkOTZSl/ydYdmFgP2HeVw/Ug4BiSlHWgzkBIUj4DUGTxtAn3g==
X-Received: by 2002:a50:a412:0:b0:543:f08:fdc with SMTP id u18-20020a50a412000000b005430f080fdcmr1487536edb.9.1700815861910;
        Fri, 24 Nov 2023 00:51:01 -0800 (PST)
Date: Fri, 24 Nov 2023 03:50:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231124035038-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
 <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsqasttUGjOJwogPoU2+HFurFK+gxY1gO9Pg8+s4JReZQ@mail.gmail.com>
 <20231124011846-mutt-send-email-mst@kernel.org>
 <CACGkMEusUPTFfi5Gmu=Fg2vFF5i71e7rfsk_21HabqCq_06suQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEusUPTFfi5Gmu=Fg2vFF5i71e7rfsk_21HabqCq_06suQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Fri, Nov 24, 2023 at 02:28:44PM +0800, Jason Wang wrote:
> On Fri, Nov 24, 2023 at 2:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Nov 24, 2023 at 11:25:41AM +0800, Jason Wang wrote:
> > > On Wed, Nov 22, 2023 at 2:32 PM Parav Pandit <parav@nvidia.com> wrote:
> > > >
> > > >
> > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > Sent: Wednesday, November 22, 2023 10:59 AM
> > > > >
> > > > > On Wed, Nov 22, 2023 at 5:18 AM Michael S. Tsirkin <mst@redhat.com>
> > > > > wrote:
> > > > > >
> > > > > > On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > > > > > > Lingshan claimed that suspending device is for live migration in commit
> > > > > log and in discussion he portray it as some basic facility unrelated to device
> > > > > migration such as debug etc.
> > > > > > > > Instead of claiming it as some non_device_migration facility does not
> > > > > make sense.
> > > > > > >
> > > > > > > It is used for migration for sure.
> > > > > >
> > > > > > Well having a generic facility to stop device sounds like a nice thing.
> > > > > > However the devil is in the detail. A lot of detail here seems very
> > > > > > much tailored to a very specific implementation in mind.
> > > > > > So thinking through how it will work e.g. for power management would
> > > > > > be a good excercise to figure out how it should work in detail.
> > > > >
> > > > > It might work in the case where there's no PM support in the transport. E.g for
> > > > > MMIO devices.
> > > > >
> > > > MMIO should implement PM like other transport. That brings the equivalency principle.
> > > >
> > >
> > > MMIO are usually platform devices. I don't see the point.
> > >
> > > Thanks
> >
> > I don't understand what you are saying. Why does it make sense to
> > suspend individual platform devices when they are suspended
> > with the whole platform?
> 
> It is because we don't need to suspend the whole platform to migrate
> the virtio-MMIO device.
> 
> Thanks

We were talking about uses beyond migration.


> >
> > --
> > MST
> >


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

