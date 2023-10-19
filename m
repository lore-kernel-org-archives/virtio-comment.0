Return-Path: <virtio-comment-return-7862-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3B5CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:54:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A8B4412920C
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:54:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A0D7F9868E3
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:54:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 948E99868DA; Thu, 19 Oct 2023 09:54:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86EFC9868DB
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6KrVNorhNKSWhCHUpI5wnA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709289; x=1698314089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ph5aLWGFDfMfc1ENUeHZcTKhszTlJseMvNwPq8Y29E=;
        b=eXwCOfNmVBCm4XH+q8JDFscRDRejxRkNP6RHBPAeUBJr7E4/+UY/N0GEs92VvOVyC8
         zWeudvWOFnfBZRTQrbIqK21ncyXB6R2FFFW82h7SV+zRgHx2dzU7hxmktq0u/zazEUAa
         VYsAd0thTUaV6HZoN11aVEyVH3NqWgVE1x+nobZAkW2HpDZPEMNg52fczUisE8jPK3IY
         HWLm4GHvNioTkdgl+SYP6gY64bFbhCA/HaAVsIIk6mbq3INlJ40h6R6wL70/itTSP8xf
         SYKylRTuR9sl7/lZ4m/3N2tcWvx15+pWYfpcDoe/phE/7ykcdONvEpm0MwTPoapyTWmf
         yqxw==
X-Gm-Message-State: AOJu0YyKO0Rj23YpmE+2GY7ZGlZf7jwbyxsiWh/sY4Po1CqflnRMPixI
	DGPtrL/9aigOhcc+Zp5wQ/wBGjr7wYBEoAnV86rtzz1vf4NRdRc+Fm1UtfYANb3sKglLb8HvwbN
	UhRnrSxD1hzDydisoNYlNPLNQ6jp/G1gEug==
X-Received: by 2002:a05:600c:4f45:b0:404:757e:c5ba with SMTP id m5-20020a05600c4f4500b00404757ec5bamr1350037wmq.26.1697709289805;
        Thu, 19 Oct 2023 02:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqBA9RbNX7RWcYZl49xfWO+NNi62ZAH1Yk3sE3eS4ox3x5DosSmRz4oh3J9ZHXCEmzfjKaAQ==
X-Received: by 2002:a05:600c:4f45:b0:404:757e:c5ba with SMTP id m5-20020a05600c4f4500b00404757ec5bamr1350021wmq.26.1697709289470;
        Thu, 19 Oct 2023 02:54:49 -0700 (PDT)
Date: Thu, 19 Oct 2023 05:54:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019055352-mutt-send-email-mst@kernel.org>
References: <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
 <20231019052725-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C638743682F55F11BA28DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019055251-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231019055251-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 19, 2023 at 05:53:29AM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 19, 2023 at 09:41:46AM +0000, Parav Pandit wrote:
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 19, 2023 3:03 PM
> > > > > > With a capability you can discover it without poking at features.
> > > > > >
> > > > > It is discouraged by pci spec.
> > > > > Pci caps for mostly doing very small init time sort of config.
> > > > > Not to run frequent commands.
> > > >
> > > > Interesting. where in the spec exactly?
> > > 
> > > And the reason I ask is because I'd like to understand the exact limitation.
> > > 
> > > In any case, we should still maybe look for ways to separate it from config.
> > > Maybe a capability points at a BAR and that is where we have this stuff?
> > > 
> > Yes, I replied in your previous email, a similar suggestion.
> > Lets first agree that it is drafted for non-passthrough mode.
> 
> I could see passthrough use it too if there, why not.

The big limitation of such a hack is dependence on PASID.
So it's more of a long term option when PASID becomes more
widespread.

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

