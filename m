Return-Path: <virtio-comment-return-8407-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B08EC54FB9
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 12:00:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AAEFA133341
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 12:00:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 850A0986DEB
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 12:00:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4186F986DDD; Thu, 16 Nov 2023 12:00:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26C3D986DDE
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 12:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: t-y_AVutMNuGUV_cMqZW4w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136000; x=1700740800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXBV4jOTZrO+hYk4rqWetQSUrWM13DqSKjZIJH4uQe8=;
        b=VbWiXEpolUFza6NCm7e7BY+5a0CQC+YRyJp5+52Eme2tS8vSUo/m19Mpbg8kYNSxsk
         qwCqub4XDMZCWpADPF8iScN2e3UFGeI3pNltsGFvz8eLSy45nhkY+CKqQX2bhPO4C98a
         uvUrsvsUE6fap2512k0KhPT8RkIDGYnCBmCaU1L1mNw6gb813sVEAwjMlIFo3xP+ABNb
         HUeQWybe+VFKcf/+9npdNYJ3vmz+fwquz9oIMdmTs9FKcJb8aerbAPNzmr14tMaA8b/S
         0CHSgqcpDXTsABW8EbgsL7ZliQ2izsQSZIlgUVoqvrNF0OEQjq1JGYRTnVx7yl5fwYFV
         Ywjw==
X-Gm-Message-State: AOJu0YyWsCubfNzrk7+IT4qCefvR//5zwSl85azWIdL8oAbHZ4y2Yf2e
	8HkJrd1OeAIxyabU5d7nmMHELqhvlazV1leNQYHcE8hr973zYMm1n0hKWzJ0fS+6ZRZqBXtIh4d
	MWiHa7oxUd0/QpDC6PijXUh3ebppZvXT+mQ==
X-Received: by 2002:a05:6512:3e26:b0:507:9740:b6db with SMTP id i38-20020a0565123e2600b005079740b6dbmr14822244lfv.67.1700136000282;
        Thu, 16 Nov 2023 04:00:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI7HtgXawT24nXYiltYeVY1hFyPVmR8+TidQBt851JTf6sT/49JDyuRhWo16wViTXfVdPpsQ==
X-Received: by 2002:a05:6512:3e26:b0:507:9740:b6db with SMTP id i38-20020a0565123e2600b005079740b6dbmr14822219lfv.67.1700135999920;
        Thu, 16 Nov 2023 03:59:59 -0800 (PST)
Date: Thu, 16 Nov 2023 06:59:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231116065416-mutt-send-email-mst@kernel.org>
References: <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
MIME-Version: 1.0
In-Reply-To: <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > We should expose a limit of the device in the proposed WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > So that future provisioning framework can use it.
> > > 
> > > I will cover this in v5 early next week.
> > I do worry about how this can even work though. If you want a generic
> > device you do not get to dictate how much memory VM has.
> > 
> > Aren't we talking bit per page? With 1TByte of memory to track ->
> > 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > 
> > And you happily say "we'll address this in the future" while at the same
> > time fighting tooth and nail against adding single bit status registers
> > because scalability?
> > 
> > 
> > I have a feeling doing this completely theoretical like this is problematic.
> > Maybe you have it all laid out neatly in your head but I suspect
> > not all of TC can picture it clearly enough based just on spec text.
> > 
> > We do sometimes ask for POC implementation in linux / qemu to
> > demonstrate how things work before merging code. We skipped this
> > for admin things so far but I think it's a good idea to start doing
> > it here.
> > 
> > What makes me pause a bit before saying please do a PoC is
> > all the opposition that seems to exist to even using admin
> > commands in the 1st place. I think once we finally stop
> > arguing about whether to use admin commands at all then
> > a PoC will be needed before merging.
> We have POR productions that implemented the approach in my series. They are
> multiple generations
> of productions in market and running in customers data centers for years.
> 
> Back to 2019 when we start working on vDPA, we have sent some samples of
> production(e.g., Cascade Glacier)
> and the datasheet, you can find live migration facilities there, includes
> suspend, vq state and other
> features.
> 
> And there is an reference in DPDK live migration, I have provided this page
> before:
> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html, it has been working for
> long long time.
> 
> So if we let the facts speak, if we want to see if the proposal is proven to
> work, I would
> say: They are POR for years, customers already deployed them for years.

And I guess what you are trying to say is that this patchset
we are reviewing here should be help to the same standard and
there should be a PoC? Sounds reasonable.

> For dirty page tracking, I see you want both platform IOMMU tracking and
> shadow vqs, I am
> totally fine with this idea. And I think maybe we should merge the basic
> features first, and
> dirty page tracking should be the second step.
> 
> Thanks

Parav wants to add an option of on-device tracking. Which also seems
fine. I think it should be optional though because shadow and IOMMU
options exist.

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

