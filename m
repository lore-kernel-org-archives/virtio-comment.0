Return-Path: <virtio-comment-return-6191-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5F9C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:10:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F3C01CA24A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:10:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77AB2986587
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:10:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6C5B1986586; Tue,  6 Jun 2023 23:10:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5912C986585
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 23:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: mzTmGHYlOmO0EBMdYCM1oA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686093040; x=1688685040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qrt7F/2Jun9O7ZX9cfQfhRoXjW+2LgeUzHMFHENskX8=;
        b=eYtchEoksdNuYsFCh2qlZmTOmGPTH1gYWWaETL8lMMUMIID9Nt7scnQqPNh3duS0pZ
         YUOczsDdvnkJ8+gpuZTTYbab67F0DqemtMRTquBHrunqy7qv6nn5YdTkGpQkzfcjHzZG
         GCjr4xg2tUNKw1SHBj0lOk0hQB+cdeARsUxz8/ARmlT7mx4B6i/prrWERQVopKReIYCy
         ifx8SISFEshJVrWfrQ7Kq8dksygncDRZLvrBYgoxPO0rah2KSxNAaenGvzcZPzmbd4Wu
         eb90h4xp+NqyDD9QEu2JC86zKKW8FbK4KdbmWH/iMyv0qlXo35iDWzqOyF2kdZdBTVrf
         7OdQ==
X-Gm-Message-State: AC+VfDxC3o+OLYFXk7WWhgcQNG9D34bt6I1LquXTAoxwd7d/bRFLVuir
	W5p9Keod16AtcMyHLRH5JeX8eaEicoOhe5nW2DSnXFU7gDk6uwH5A96oFA04xmBZHrVO1MM+mKR
	DTHGlAVCmNxVj4RKiTeOxadLW4QCIExMaLg==
X-Received: by 2002:adf:ffc2:0:b0:306:3e96:6c5f with SMTP id x2-20020adfffc2000000b003063e966c5fmr2494693wrs.15.1686093040413;
        Tue, 06 Jun 2023 16:10:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6eJnB5WEJaU+zIsiYf7w0SezaxWW+e72O+ij6ujy94tEg5GoQJhYDb0S5rQ/0ORZC67MUOEg==
X-Received: by 2002:adf:ffc2:0:b0:306:3e96:6c5f with SMTP id x2-20020adfffc2000000b003063e966c5fmr2494685wrs.15.1686093040161;
        Tue, 06 Jun 2023 16:10:40 -0700 (PDT)
Date: Tue, 6 Jun 2023 19:10:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230606190839-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230606184141-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481531282FA61F8D0F66144DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481531282FA61F8D0F66144DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 0/7] virtio net new
 features requirements

On Tue, Jun 06, 2023 at 10:56:51PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 6, 2023 6:50 PM
> > 
> > thanks for write up! great start.
> > 
> > some things look a bit more like a specific design that you have in mind. we
> > need to take a step back and include the actual requirement too. it's ok to list a
> > design idea too (you call them examples here).
> > 
> > splitting different areas in separate files might be a good idea.
> >
> Yes, as it grows, will likely do it, when the design part takes shape and gets extended as section.
> At present with 10 to 20 lines in a file is overhead.
>  
> > some things will require virtio core extensions.
> > 
> > I have a generic comment about limitations such as alignment physically
> > contiguous etc. It's natural for hardware vendors to try and push complexity to
> > software, but in the end this might just shift overhead to driver/TCP stack.
> Mostly for sure not the TCP stack.
> Some part may be to software.
> Overall software cost might be same or probably slightly higher but can have overall system improvement.

Then pls spend some time for each requirement documenting drawbacks too.
Almost anything has tradeoffs, listing them makes you actually think
whether things are worth it and shows others you are being objective.

> > Please try to add motivation with each requirement.
> 
> > I pointed out some of such cases as "weirdly specific".
> > 
> Yes. I had the rationale section, but I dropped it in the initial version to add on need basis to cut out the obvious.
> Will insert some of it in v1.


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

