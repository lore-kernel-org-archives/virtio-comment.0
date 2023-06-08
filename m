Return-Path: <virtio-comment-return-6248-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B983C7EE37
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:05:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D4EB32B010
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:05:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A540A986675
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:05:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8FE1498666F; Thu,  8 Jun 2023 15:05:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C5D498666B
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 15:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DwPcbhylNVSp6W1MhnF9yA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686236637; x=1688828637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBZ8zJ+mOpk54ZEDFfA4+9UVvzU3kDJsb4RhrOaV6rI=;
        b=QzyQt0pp/aU+Y5vMzikGFmSHVEGVV4SPVHODikRlfFZ0pgDe2YJ9NHn5XLwOK9PbMc
         nW2N+mDIh36D7KlSMykoc9CXev9sFQglDN7aSsrKJLkcVaYMSU89lAlhp6u7uLWvqVfD
         dYSPVQvKR1KTzujUF4XwzMcI7g1iiwTd68PRbEi2UuU34PaYQpecQnrIWfxXfUytp1Sa
         lY0b2pI6723/GDaqklwcKIk0lQT+VcAbUXR4PKVDZZIZWux84RDTZCyU3bRnKhHtOjf1
         y7cA1BDc/WA2KIGJkYTN1NJDhjvisQQ7X1ZlIQODILPsbGLaJkgloqc5zmMUcITPSn43
         Xa3A==
X-Gm-Message-State: AC+VfDwUcAim8ROsG0Ybr7U3HL8A5/a6/4AJpHCgxPnkH5tQ7IVM3DIL
	qZC9eh00geZcQKMjeEQ9eXA+IfCf1XvIiXG6IYDKqvB9VJwerXf+F6uhNfAlRQcpKXS3dkzpJao
	f+0zw3uDLjjTwWrzf3ovkzfimUBbIk6pLsg==
X-Received: by 2002:a5d:4564:0:b0:30a:efcc:f89a with SMTP id a4-20020a5d4564000000b0030aefccf89amr2188531wrc.2.1686236637231;
        Thu, 08 Jun 2023 08:03:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4F0ZTzRapRyKx9xbLmUWLECLOadyhMfXYnFeYG0edhqHzhyqhybUXywIviQ5OurTny3NVJFg==
X-Received: by 2002:a5d:4564:0:b0:30a:efcc:f89a with SMTP id a4-20020a5d4564000000b0030aefccf89amr2188511wrc.2.1686236636910;
        Thu, 08 Jun 2023 08:03:56 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:03:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230608105640-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org>
 <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
 <PH0PR12MB5481D80A48F3BD82D86B3DB0DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com>
 <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230608104215-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810E0A5A5E56B6420EB05CDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810E0A5A5E56B6420EB05CDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3] transport-pci: Introduce legacy
 registers access using AQ

On Thu, Jun 08, 2023 at 02:53:28PM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 8, 2023 10:44 AM
> > > Since this ABI reflects what we agree on, I would want to raise for
> > > vote in coming days to be part of 1.3 in few days as we have more than 3
> > weeks to sort out non-ABI language part.
> > 
> > I think there's a bunch of work to tighten wording in v4, don't believe it is ready
> > for vote yet. 
> 3rd patch has the conformance section.
> Rest of the legacy interface semantics are just same as today.
> We are not fixing the legacy interface itself, so not sure what to tighten specifically.

I'll do a proper review after the forum. Generally
lots of small things. Went looking just to give you a couple of
examples:
	  too many mentions of VFs and PFs.
	  text should talk about owner and member. Minimise
	  mention of VFs to make it easier to extend to
	  different group types.

another example:
	+The PCI VF device SHOULD NOT expose PCI BAR 0 when it prefers to support

VFs don't expose BARs at all. PF exposes VF BARs in SRIOV capability.



> > Unfortunately I need to get ready for travel and then travel for the
> > kvm forum, during this time I will try but I can't promise when I will be able to
> > go over it in detail and send comments. Back June 20.
> 
> Ok. that will be really helpful. I will revise v5 as soon as you and others have comments.
> 
> Total line of spec line are < 200 lines including the 1st clean patch.
> And changelog anyway precisely captures what changed so should not be too many reviews to me.


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

