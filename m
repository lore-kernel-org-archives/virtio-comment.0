Return-Path: <virtio-comment-return-4840-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58A3C6FD1F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 13:57:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B798042A7A
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 13:57:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AECA99866FE
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 13:57:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A524A9866F6; Thu,  9 Mar 2023 13:57:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 927859866F8
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Mar 2023 13:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3ZICozp5PbmBc-5KdJ14sg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBLmwFBOHDw6t8kGtGh293Y7qqAxNo+s9fLtldRHTkU=;
        b=duzf32jUW9jS7+X8Akyv3XMsRQX1jDbLMjZKlIFA+qVb3gik8WY+gRuXKe2W1Jl0N7
         HMppRKFcm9HoFTMQRc///t0eydR1tKdZkWg/sXhxGa/2wl8egbbHwGQqpjVTbTBWPdHZ
         gT0/vHvJohffQ97bZtzHVteve3oFBYPMhF7v+FN7HHqr+C+aUgjl/jyhC1nAEct9n6YZ
         muqNdqW+s1eR6Arr4ztDIwfnhm20ijMU8YQ9+D90G8H49JPh0zAtKYYPgRXA1oLIxytU
         MZYZNcMXWLASKhrH1rUtEhOkhF1G8RagCgSUTEYnGhEBAuDYqoDWADi7rFSLOMyimQWe
         Sb+g==
X-Gm-Message-State: AO0yUKXb0hu5Cv0jCrMldqlJ6eeVet5HfjPnzlIVjv5APRVL57qwaJ84
	3UOrjLDcGayv4ZUjiaVr6tSy5cnOC7x09pDtXyZ6ghGZ9dsRa8i0IrYNcuxV2J4Q9F1ZbeX5Xb4
	TkeSnFNrqp8oO25XOT4wCgtsgQW2l2boxvA==
X-Received: by 2002:aa7:de11:0:b0:4ab:497a:2e84 with SMTP id h17-20020aa7de11000000b004ab497a2e84mr21716550edv.12.1678370253115;
        Thu, 09 Mar 2023 05:57:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/cEpxjaZSjB4LBAX1xlcoMbUPbOy2fJkK53hGDSOrPbboBzxL1bqLN5Tp6B9c3Dlbq68KYdg==
X-Received: by 2002:aa7:de11:0:b0:4ab:497a:2e84 with SMTP id h17-20020aa7de11000000b004ab497a2e84mr21716525edv.12.1678370252864;
        Thu, 09 Mar 2023 05:57:32 -0800 (PST)
Date: Thu, 9 Mar 2023 08:57:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jiri Pirko <jiri@nvidia.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230309085605-mutt-send-email-mst@kernel.org>
References: <ZAbpiRVdo8BciELX@nanopsycho>
 <20230307111458-mutt-send-email-mst@kernel.org>
 <ZAhdzCd6qwWydesz@nanopsycho>
 <20230308064505-mutt-send-email-mst@kernel.org>
 <ZAh61E/wQ/hSY/OI@nanopsycho>
 <18d51bc0-d759-1a05-cb7c-3d46c4ed2f1a@nvidia.com>
 <m2wn3rxgv5.fsf@oracle.com>
 <PH0PR12MB548150700B50006F9F174104DCB49@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ZAmLIc97Ud09YfGT@nanopsycho>
 <PH0PR12MB54817E2CEFF003E793C9B2F3DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817E2CEFF003E793C9B2F3DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] [PATCH v10 04/10] admin: introduce
 virtio admin virtqueues

On Thu, Mar 09, 2023 at 01:04:30PM +0000, Parav Pandit wrote:
> 
> > From: Jiri Pirko <jiri@nvidia.com>
> > Sent: Thursday, March 9, 2023 2:31 AM
> > 
> > Wed, Mar 08, 2023 at 10:25:32PM CET, parav@nvidia.com wrote:
> > >
> > >> From: virtio-comment@lists.oasis-open.org
> > >> <virtio-comment@lists.oasis- open.org> On Behalf Of David Edmondson
> > >
> > >> In support of live migration, might we end up moving large amounts of
> > >> device state through the admin queue?
> > >>
> > >Correct.
> > >
> > >> If so, that would seem to have some performance requirements, though
> > >> I don't know if it would justify multiple admin queues.
> > >DMA of the data through the proposed AQ is supported.
> > >
> > >If I understood Max correctly when Max said " This AQ is not aimed for
> > >performance ", he means that AQ doesn't have performance requirements as
> > io/network queues to complete millions of ops/sec.
> > >
> > >it is several hundred to maybe (on the higher side) thousand ops/sec during
> > LM, provisioning use case.
> > 
> > But isn't it good to design it for performance from start? I mean, state transfer
> > of thousands of VFs at a time is definitelly performance related, isn't it?
> > 
> It is. Which part of the proposed AQ doesn't cover this aspect?
> The only issue that I see today is, that a given GET family of commands q contains the read-only and write-only descriptors which require multiple dma allocations on driver side.

BTW for a while now I wanted to add a descriptor flag that
will stick data inline in the descriptor. Perfect for passing
small bits of data such as vqn, or the virtio header.


> > 
> > >
> > >DMA perspective as you mentioned, AQ still has the same perf requirements
> > as that of regular nw/blk io queues.


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

