Return-Path: <virtio-comment-return-7847-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B439C46CA1
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:11:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9C9F668468
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:11:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85C0D9868D0
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:11:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 774FD9868CE; Thu, 19 Oct 2023 09:11:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 686A29868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XAu4KG0yMJK-tmKA3NfNNA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697706680; x=1698311480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZgZDsKkYz2bIbeU8abfQQXrDFSCVL5PKfWwKPH1Q5Q=;
        b=DZbuKVaZo38KOQ9IN7UCzv51Ix5g1z9vOxf/+rrNoSct4hXYW+FAn9hOlGGYA5SAhh
         ErHlnLZnsZ/jUW/ENbOaYUrt4tu5J1Cjs4ENuVZbnD4zlRbG0iG0I7fmpqj3FmZnmkWU
         09aHY4vlf2SERkpdr8FeO8Sdv7GVPZMQBbkTP5WtbShb32Nw4fvbVhMzHZ8maKpvVtX0
         V3w2sIMWpejUC1zJs855+gnKx67Xakffcohv1kYATwpFRqn4gvkiMxx7CY7yQ4YxQOmn
         uL7UZsJGIrodKsnRzaia2VzNEIXrJqKsBrG2HOh8/5VoCm6wXsINEag7n/x1EAzMT1vu
         snbg==
X-Gm-Message-State: AOJu0YyWKqGwPoJGXy323OZ4ppJeY6JCeURnTk7maksfrIJrj3IMssDL
	FcMnZAA2P4nVCFR2diUz4rXx0x2dCdzkMfaSN6Neu9yRdh9sEaEUW6Cj6C6pCK0cALHQLYDEDwa
	a9oOI3CXHorMD8lW48lKbtgGTXmmuiRcM0Q==
X-Received: by 2002:adf:9d86:0:b0:32d:a781:111 with SMTP id p6-20020adf9d86000000b0032da7810111mr1097214wre.15.1697706680185;
        Thu, 19 Oct 2023 02:11:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTX/+SYSybAw73uDsRn6vyYdrVSdmdZGlVQeIGU8fo0EuMNKl+/rhSyJcMFrCXMR0cJXYz5Q==
X-Received: by 2002:adf:9d86:0:b0:32d:a781:111 with SMTP id p6-20020adf9d86000000b0032da7810111mr1097196wre.15.1697706679819;
        Thu, 19 Oct 2023 02:11:19 -0700 (PDT)
Date: Thu, 19 Oct 2023 05:11:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019050553-mutt-send-email-mst@kernel.org>
References: <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 19, 2023 at 08:58:10AM +0000, Parav Pandit wrote:
> It cannot be in the PCI 4K config space for sure.
> It must reside in the virtio config space.

Why? My concern with virtio config space would be
that it's not orthogonal to other things in the
config space. E.g. you need to look at feature bits
to discover presence. How does this work while you are
documenting that device can undergo reset at any time?
With a capability you can discover it without poking at features.

> I am sure that this is used for passthrough mode of #1.
> So, can you please confirm to write this up for mode #2 only?

To me it sounds like a generally useful capability that could be
used as basis e.g. for admin command transport.

> > > A variation of that for the member device, there is owner device, hence
> > admin command on the AQ can be used.
> > >
> > > If we can converge on common virtio interface between #1 and #2, great.
> > > If we cannot be due to technical issues, we shouldn't step on each other's
> > toes, instead build the two interfaces for two different use cases overcoming its
> > own technical challenges.
> > >
> > > And when in future, someone want to implement different kind of bisections,
> > they can propose the extensions.
> > 
> > Not good at all, this means the interface is very narrow.
> > Your "propose an extension" just doesn't work practically.
> > It takes years for things to be widely deployed in the field, by the time they are
> > there are more use-cases.
> 
> We usually see it getting deployed in < 1 year time with new spec advancement pace for many features.
> Building something for unreasonable amount of time without use case results in missing the immediate deployments that happens in 2024 to 2027 of 1.4 spec time frame.
> 
> > We need something universal and admin commands were supposed to be just
> > this.
> I don't see a universal solution for all problems for above #1 and #2.
> 
> Solving above #2 will cover large part of deployments that users are doing.

OK. But additionally, if an interface can cover a couple of use-cases
we can be reasonably sure it's going to cover more going forward.


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

