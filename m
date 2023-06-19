Return-Path: <virtio-comment-return-6394-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5392EEB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B088E29FD0
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A62D1986430
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:20:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9CD089863A6; Mon, 19 Jun 2023 17:20:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B0DB9863A9
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 17:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: jFA3s2cYPXa7MH6FSvPpug-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687195194; x=1689787194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4m+16vHguMVMy0Pb/bvEk7lF31voKu/z5TT3sLZbXw=;
        b=cfgTmLxiKvg3ounJgTpOpXIE/Nodooc/YlxtciQlSq2h/w1Qh/kI9qICeRnrfc2cv0
         UYOxjBCGLvVERSmvOuPuWtpjL9HHbjIafTJGqPf6wTvjJwpp4Flg/BIOUqBTbIE1CcZC
         lPeMYghIvLLddmdpduLtHG2wneeXeM5854CTSGO139xErrvaOFqdatl7q+d3LnVFxIb3
         DQqFRm9ksTi+6N6wXblnt2PA3cln1p59EF4S1AUKdyoAh6kemYFZEUx7gXDuHrfGhS5q
         JmEqgIIov90gAuhJMeCx8cHI6GJzcjtzq+5ZyKgiMcJySEiT+oZaZ7ywkHV+zrDNl2Sx
         aQBQ==
X-Gm-Message-State: AC+VfDwe6Hgg7stRJMGQawjKe82+N6QF/55LOLuQhxlgDzfh5nebIf3d
	p+NOR2wLPhS+/0tOK6pPAK+siGWxEe46bDd8iUgHfUIZieVYwxwX86OBr8gY7WjpBZ3tHvx+0q5
	a/K0zbKOmlF/o9SBDw644vEBhkBEJnS+adA==
X-Received: by 2002:a19:5052:0:b0:4f4:b3e2:ff54 with SMTP id z18-20020a195052000000b004f4b3e2ff54mr6203464lfj.51.1687195194230;
        Mon, 19 Jun 2023 10:19:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ590fgarS4uUt6aOepzUPcbTbMxuk4pCuIt8VgnSypjUi56yuRapiZ6AwQOqjLQcLKjOpe5ow==
X-Received: by 2002:a19:5052:0:b0:4f4:b3e2:ff54 with SMTP id z18-20020a195052000000b004f4b3e2ff54mr6203446lfj.51.1687195193843;
        Mon, 19 Jun 2023 10:19:53 -0700 (PDT)
Date: Mon, 19 Jun 2023 13:19:49 -0400
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
Message-ID: <20230619131115-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-5-parav@nvidia.com>
 <20230619122836-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481758B8EE080750D6377C0DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481758B8EE080750D6377C0DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v6 4/4] transport-pci: Introduce group legacy group
 member config region access

On Mon, Jun 19, 2023 at 04:39:16PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, June 19, 2023 12:38 PM
> 
> > >
> > > +\field{legacy_q_notify_supported} when set to 1, indicates that the
> > > +device supports legacy queue notifications at this notification
> > > +location. Legacy Queue Notification address is derived within a BAR for a
> > virtqueue:
> > > +
> > > +\begin{lstlisting}
> > > +        cap.offset
> > > +\end{lstlisting}
> > > +
> > >  \devicenormative{\paragraph}{Notification capability}{Virtio
> > > Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification
> > capability}  The device MUST present at least one notification capability.
> > >
> > 
> > I was hoping that we can avoid touching transport-pci.tex completely, this is
> > why I wanted to reuse VIRTIO_PCI_CAP_NOTIFY_CFG.
> 
> It is reused, but it doesnt come for free.
> Do you want to re-consider AQ notify query command?
> Or continue as proposed in v6?


If we can't just make it come for free then maybe
VIRTIO_PCI_CAP_LEGACY_NOTIFY_CFG is better, we can just list the number
in the common section and then link to the description in the new
section.

I also feel we want ability to have such a capability in the owner too.
Would prefer including it now though I guess we can add it as an
extension.

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

