Return-Path: <virtio-comment-return-6771-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FB1EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 20:28:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E2D722B011
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 20:28:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C9C1E98680A
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 20:28:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B2D5C9867B6; Thu,  6 Jul 2023 20:28:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9EA1C9867EB
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6SRc5uuVOnWSkYw6-tudCA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688675316; x=1691267316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUyaMi950aL/hHkWdSq+JGXYXS6LA6Ax3X1Mex+ekmM=;
        b=ju/f9KsxMpa1ZHZtOtVT8sNxOe8Mr0dKN8uZZpbL0tZf4N0p3kYL5Av9jJxvuPKo2g
         T460O16ghX22eFtEqQGOVKetVUdDIGyu8+AdaSVCD+g4EnEgm4nBFm1OctgeJtBduD66
         k8wGewo3oXWSzVwFgVlMxOuHSgnL+JUt3fu4NZiZadcoy+H5la47/pe/wcH6K7hS26GQ
         DaAqaWUrz+t0H84+9DaipP74z16+q3FeBwFM5NDNv93K0HCRNZgvfmi7lpeikhmsREAL
         M2PdwisTTxKFnDIuKnEdDPhTgbj4C/p35xo2ODv/jMKxCASDPMI1/2GQr11ib7DFkq68
         dfFA==
X-Gm-Message-State: ABy/qLaMjrPgqkFW2Y8s+psd+iVoEonSX3xBsNjcCxju00s0WyK2v8Xn
	rx8FoW3lOdmRCCktSIMCo26n10j//f2p3/iTbTNz2WM3fpIMzmbWYszClYZ9/Ynn6mLiBYWt1Hm
	Khc5zh1SqF0Jm3yZIHJAsnJB5ezLLPDfaYA==
X-Received: by 2002:adf:d08a:0:b0:314:3b68:eac6 with SMTP id y10-20020adfd08a000000b003143b68eac6mr2221328wrh.12.1688675316561;
        Thu, 06 Jul 2023 13:28:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGmJJfRhv9uUINk9T7sbB4LgIWN7drQrUZu+o31rIObUwMHQgxIX3VUxRkIVdinecSYmTebhg==
X-Received: by 2002:adf:d08a:0:b0:314:3b68:eac6 with SMTP id y10-20020adfd08a000000b003143b68eac6mr2221308wrh.12.1688675316255;
        Thu, 06 Jul 2023 13:28:36 -0700 (PDT)
Date: Thu, 6 Jul 2023 16:28:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230706162505-mutt-send-email-mst@kernel.org>
References: <20230706132638-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813564E839C71709DCBDEFDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706135858-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B845ED0FDA919B822941DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706144427-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817A61E0062B9BF3401836DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706145538-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481074A79C630384382CB20DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706154002-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AF3000FFDBA2CBA5D7ADDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481AF3000FFDBA2CBA5D7ADDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 4/4] transport-pci: Introduce group legacy group
 member config region access

On Thu, Jul 06, 2023 at 08:21:13PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, July 6, 2023 3:43 PM
> 
> > > > As the order is there anyway, why not just prescribe entries are used in
> > order?
> > >
> > > I don't see any value in defining any order. It is an array of entries not a priority
> > list.
> > 
> > I think we are losing out. For example I can see how access through member
> > would be preferable for ordering reasons.
> > However device might still allow access through PF for cases where driver can't
> > access VF.
> > 
> So a driver can choose say I prefer order over accessibility over VF, so it choose PF.
> Device doesn't have the knowledge anyway whether driver can/cannot access the VF.
> So, device's preference vs driver's preference may be different.

The driver has a final decision. Let's make it a SHOULD and then if
driver knows best then it has the choice?


> > But I don't see any configs where leaving this to the driver's discretion is
> > preferable. If you see one let me know.
> 
> In doesn't need to be config.
> It is the environment that chooses which is preferred by the driver.
> For example preference of accessibility over ordering.


what does accessibility mean exactly? I definitely see
OSes where owner driver can't access a member.
So in that case naturally driver will skip the
entry for member even if it's first. maybe there are
configs where member access is possible but is very slow
e.g. with lots of indirect function calls?
OK fine, but then it will be up to the driver to test and
make damn sure the benefits outweight the costs.

IOW it's a hint for the driver. If you like you can say
it explicitly even.



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

