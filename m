Return-Path: <virtio-comment-return-6389-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1199AEB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 16:40:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 52487370EB
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 16:40:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47216986428
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 16:40:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3DEAF9863A6; Mon, 19 Jun 2023 16:40:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CB379863B0
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 16:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: n6nRsT7PNHuVKOB_HZAyrA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687192833; x=1689784833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8v0Lt+PCTfdBya1XTMNg1bFqIV3nrVKNz0YQP65aQzM=;
        b=QH8wLHyzoNfa258TsufKpzUR9y8GEBqbZx1dKaSyoKTxlK4Qjf9yDVLzayfsgp8t3Y
         H8VOObkXDu9Dw84JRMWq9jx3HooSti3eS1ok0msQ6Dc4r2fkJLBfeSTbA4cg1SMlL9Ft
         2+ONG22d7YBCFhgdOTSd7684QnW2G9M4cLS5CbDhfmDaP/J0y9nqSH6n/V5GUbr/iXoU
         5C/zEfLfPLxfXMZ6fC2wU0pLeqaEycaDmZxVPIuX0ynB9KH60COw3k47MoWOfrSt2oeZ
         15sjfelnzO9/QxyQUl/wASxKFw1QniLV868DecSUs486twV/B2GWSJ5bZpFe7cgtvqJQ
         ieZQ==
X-Gm-Message-State: AC+VfDzAf00/Bez5s/yjdBZ3usSVl+y18cO44DFJCDQRr055p8INEH92
	0Y9cZeUZSJOAIFlzX1f3F+tACPLa3m2MmNQUtSirA67PsmSyjAcrJDMwQWk0J6S5eTn7QadTJhG
	LmsytUNx49S2RVMdXgICreicwKjnPZ6o1Fg==
X-Received: by 2002:a7b:c84f:0:b0:3f8:fed0:1c5c with SMTP id c15-20020a7bc84f000000b003f8fed01c5cmr5759737wml.8.1687192833202;
        Mon, 19 Jun 2023 09:40:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Sae/GAxFnyEmkDfNxSPzfLIiwzlEcTN4wLhLukZy0QQijGiNXctoGtXckwVg+GQTaDhL7tQ==
X-Received: by 2002:a7b:c84f:0:b0:3f8:fed0:1c5c with SMTP id c15-20020a7bc84f000000b003f8fed01c5cmr5759725wml.8.1687192832909;
        Mon, 19 Jun 2023 09:40:32 -0700 (PDT)
Date: Mon, 19 Jun 2023 12:40:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230619123757-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-4-parav@nvidia.com>
 <20230619121724-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EE01C25B4C170E498177DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481EE01C25B4C170E498177DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v6 3/4] admin: Add group member legacy register access
 commands

On Mon, Jun 19, 2023 at 04:29:43PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, June 19, 2023 12:21 PM
> 
> > > diff --git a/admin-cmds-legacy-access.tex
> > > b/admin-cmds-legacy-access.tex new file mode 100644 index
> > > 0000000..89a4f49
> > > --- /dev/null
> > > +++ b/admin-cmds-legacy-access.tex
> > > @@ -0,0 +1,138 @@
> > > +\subsubsection{Legacy Interfaces: legacy configuration access
> > > +commands}\label{sec:Basic Facilities of a Virtio Device / Device
> > > +groups / Group administration commands / Legacy Interfaces: legacy
> > > +configuration access commands}
> > 
> > I think this is where all the theory of operation text should go.
> >
> This is where most of the theory of operation is documented which is agnostic of the transport.
> PCI specific things are left in pci transport section.

what I am saying is that it's cleaner here at least for now.

> > > +
> > > +The group owner device can optionally enable the driver to access its
> > > +member devices legacy common configuration and device configuration
> > > +region
> > 
> > we can just say "the legacy interface of member devices"
> > 
> What is the harm in telling explicitly what is currently supported, specially when it theory of operation description section.

The harm is that
- making things generic on the 1st try is the only stick we have
  as contributors always push to make their solutions as
  specific to their needs as possible
- people are lazy and they will copy text and then
I get to repeat this argument all over again.

If you want to also have a type specific text, be my guest
"specifically, for an SRIOV type" .... 


> > > using following listed
> > 
> > using the following
> > 
> > > +administrative commands:
> > 
> > administration not administrative
> > 
> Ack.


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

