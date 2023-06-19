Return-Path: <virtio-comment-return-6391-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B17EB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:11:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 11BA1F936C
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:11:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08104986428
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:11:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F28D99863A6; Mon, 19 Jun 2023 17:11:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1F609863B0
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 17:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: JLBT3FJlMSKBTgV6jKTvWw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687194662; x=1689786662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqE25GwlpsHbTvjqxQ9vZ9X3YKy8tDRTCmEqkFQoH0k=;
        b=gnQnVu2TwxvVtvoU354p2w4CzohclzhVmPUz54oC9qstVRd7WTdpNqymSJSM3lfln3
         2RYrhmDLRnnDL8UK6P+aqkkMsKxSFexfJnwck06lHxLkPjqh0kMmU37wocrAhQ23+Jmw
         etm6xi3lqRJ3Y8cMpakPThW0q0cQrqWfmnSc51Prt81Z8lMmuE6aeRA5uHPFBHX7Hc99
         OzpP5Y6YyEcjJlB6HTuU530ArCEk2yI6F+MijrmcNHolSEaksXiy6dBkw22rb/X+LFa1
         YC+AJpXJcrjIDGMOkGuWmT3WScZe9rvS3rtdlS+w3GvTylwbwpIx3lDXdYSBb8YzopDj
         PpXA==
X-Gm-Message-State: AC+VfDycOSYSt6xsyc1u8moGi6ee1awwAw7PFygJXeDd5kQeS+A22U1H
	Fy+Te8imojbmQmexscZT+D4dt33wqTy1RMb6Op4i/rHFGmyGglHGmGFs2mXU4MPi0YEIw1IZm7d
	UEwO8H2sPTe2MJ+l9gdDsH1BE09HLHFyEfg==
X-Received: by 2002:a7b:c7da:0:b0:3f9:b5cc:71e4 with SMTP id z26-20020a7bc7da000000b003f9b5cc71e4mr297762wmk.8.1687194662210;
        Mon, 19 Jun 2023 10:11:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xVEC5w7ZtlW4YTFh+cLPRCH1wBJJUXnxzLS+++209a4JxyKpS5S/zs3JYapUMI+BaPrYjvQ==
X-Received: by 2002:a7b:c7da:0:b0:3f9:b5cc:71e4 with SMTP id z26-20020a7bc7da000000b003f9b5cc71e4mr297751wmk.8.1687194661884;
        Mon, 19 Jun 2023 10:11:01 -0700 (PDT)
Date: Mon, 19 Jun 2023 13:10:57 -0400
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
Message-ID: <20230619130440-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-4-parav@nvidia.com>
 <20230619121724-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EE01C25B4C170E498177DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619123757-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816B14CE2DA659837D1C09DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54816B14CE2DA659837D1C09DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v6 3/4] admin: Add group member legacy register access
 commands

On Mon, Jun 19, 2023 at 04:45:23PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, June 19, 2023 12:40 PM
> > > >
> > > > we can just say "the legacy interface of member devices"
> > > >
> > > What is the harm in telling explicitly what is currently supported, specially
> > when it theory of operation description section.
> > 
> > The harm is that
> > - making things generic on the 1st try is the only stick we have
> >   as contributors always push to make their solutions as
> >   specific to their needs as possible
> > - people are lazy and they will copy text and then I get to repeat this argument
> > all over again.
> >
> 
> The "legacy interface of member device" is a vague term. As implementer, reader I don't understand what that means.
> The commands clearly communicate the scope.

Add this as an example then.

> > If you want to also have a type specific text, be my guest "specifically, for an
> > SRIOV type" ....
> > 
> SRIOV in generic section doesn't make sense. It is covered in the pci transport section.

When it's convenient to you you argue that it's clearer, when it's not
you want it generic.  Just mention it quickly and link to the specific
text in the new section.

Look the only reason I personally am even entertaining this over
objections of several members is that this stuff has the potentional to
be well contained.  That's the only argument, otherwise individual
features like _F_LEGACY_MAC would win hands down - this is how we always
did it.  If you are intent on spreading this all over the spec
we'll need to rethink the whole approach.

> > 
> > > > > using following listed
> > > >
> > > > using the following
> > > >
> > > > > +administrative commands:
> > > >
> > > > administration not administrative
> > > >
> > > Ack.


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

