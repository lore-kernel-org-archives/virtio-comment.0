Return-Path: <virtio-comment-return-6447-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33C1EB64D7
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:08:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2225E370E4
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:08:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0DC1D9865D6
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:08:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F3E519865CE; Wed, 21 Jun 2023 20:08:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D62A39865CF
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jun 2023 20:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5naPLWTfM3OAZ5c4-_SXyA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687378104; x=1689970104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl1Hu3Y+BPAuLi/3wC6EaFk6Gwa51XNJqC6eiGUHG5g=;
        b=Mmovyj+P2qjjxLtfAQHaA6dA9N1RJn+6nqYLS5pNMHyagQ7sZJy6FcdutRjIPKzYqK
         NBsN23krXi+xGpG9rdkX+wMWUBBCi++JbxFrMmqc1pKXc1Wc1RK0R/aOnRv4hBFsQBFx
         iEQN/I+aBkGpbjTCJOQNg3ExcFwko9n8lAWkljCb7U3hLA4yzyj7y9R7ZjxoAxljp8Y8
         QbzKA9q/WHNbSHKils+/YGpVTw64m46K5HS4GTl9z/IqNnijM9L0Bq3mB5USc2nM8zPd
         OYvuStu9tYjsWx2b/lTQ/9blqNUmmeY9YkH9Q9vOa4ogqtXwZxSSx9sdgU2Hywcga6oz
         qEeA==
X-Gm-Message-State: AC+VfDxsxPItGx8Jn4rC8598LPOV4RWjaZhB2qVWN28BV6Nit7lD7Qsa
	jk+3n0slNbMtWS75gWiws4frICvLb/9d9AAYBUW4+yQd3gHV5p5+ULUstgnWFtVCWyMw8s/E7un
	Aw9t+qkQsHhzJ0LH4f/8YV6uOfYXDq4yOZA==
X-Received: by 2002:a17:907:805:b0:989:450:e57d with SMTP id wv5-20020a170907080500b009890450e57dmr5368611ejb.73.1687378104321;
        Wed, 21 Jun 2023 13:08:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dUYj8RUjqwapOE9s7vNxTfRyBtcJXfSfY/im8xj8bU0KUjzWGmcEFpmHoqAywUuH9Sqw9sQ==
X-Received: by 2002:a17:907:805:b0:989:450:e57d with SMTP id wv5-20020a170907080500b009890450e57dmr5368600ejb.73.1687378104037;
        Wed, 21 Jun 2023 13:08:24 -0700 (PDT)
Date: Wed, 21 Jun 2023 16:08:19 -0400
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
Message-ID: <20230621160609-mutt-send-email-mst@kernel.org>
References: <20230619133322-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E624E00FC403C9ECFA03DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619134649-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811536BD824EAAFE8A56D5DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54815F1345502771D9FE24CEDC5CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54812103E5CB5CF860B9B50CDC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621115131-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F5232331A63C138F8754DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621153559-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481485BA45249130E309EE7DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481485BA45249130E309EE7DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v6 4/4] transport-pci: Introduce
 group legacy group member config region access

On Wed, Jun 21, 2023 at 08:04:22PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 21, 2023 3:43 PM
> > 
> > On Wed, Jun 21, 2023 at 04:01:00PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, June 21, 2023 11:56 AM
> > >
> > > > Not like v3 please. If you want to re-open this:
> > > >
> > > >
> > > > First I think we need multiple offsets just like notification
> > > > capaiblity, sorted by priority. Second I think we need ability to
> > > > report offset within owner not member.
> > > >
> > > > So please add ability to report multiple offsets, and add e.g.
> > > > a flags field, with bits for owner, member.
> > >
> > > What are these multiple offsets for?
> > 
> > Different BARs.  For example, IO versus memory. Yes I know VFs don't support
> > IO but PFs do. prefetch vs non-prefetch might matter too (non-prefetch is
> > mostly limited to 32 bit).
> >
> BAR type and its prefetch attributes are told by the PCI anyway so no duplication here anyway.

yes they are! But for example, software PF device might prefer notification in IO
BAR if that can be mapped. If not - use MMIO.


> For owner and member I get it. 
> > 
> > > Do you mean two offsets? One for owner and one for member?
> > > Both bits are optional. Do you agree?
> > 
> > I agree that everything should be optional sure. Let's not limit it to two though.
> > There could be multiple BARs or whatever. We have ability to pass buffers of
> > arbitrary length and device reports the length.
> > Maybe have a SHOULD recommending not more than 10 of these (1 for each
> > possible PCI BAR one for each possible VF BAR).
> > 
> > This is to match the functionality that notification capability has.
> > 
> A device can expose multiple offsets within the single bar to a count of 100 entries;
> Also allowed in the notification capability.
> (I don't see why any sane device would do that anyway)

Me neither.

> So I will avoid such extra restrictions and limit the scope of this patch to be minimal to have arbitrary number of BAR entries limited by the command result length.

That sounds OK.

> > 
> > 
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and to
> > > minimize spam in the list archive, subscription is required before
> > > posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License:
> > > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines:
> > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/


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

