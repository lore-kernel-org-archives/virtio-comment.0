Return-Path: <virtio-comment-return-6403-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013C5EB64DB
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:46:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BA5077A1D5
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:46:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 864D3986429
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:46:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 809139863A6; Mon, 19 Jun 2023 17:46:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E85C9863B0
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 17:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3djsDDY3N2mn6MhLdkUD4Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687196776; x=1689788776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJBl9bFulDopcvBihB7kSrsOg12O0mQgw0tMuZ5P+U0=;
        b=RIsOKNMvjMx+1V9e2r5gOow//fuzhvvcK4BTmPKd3C+sT2xtzNtVaVGzKjv+t7FWwV
         674q/KAshm4b3ZoUGWdq/ALTzbvRhzho9MU8R00Zl9bEUzLlYRHU9vkmRxmwYPbRC2FZ
         2vuBp6fDTYBexwrQPmPWCA2iIG83cx5Thi6hfImjNB9r8v3g8cPK5E/iAiMeaKc9SSiz
         Pyqzb821RRxkCYtnLMa9fD5bpZaWiuthobJazLkFCYG2WWSxwi/IoMwdP9UCNuFbA4Zh
         OvdD30opeTMfcdDPKkf1kh6DhDUD98HpAlIdubVayIz2f235Hu76vSWOBWOEtuY3yr3J
         cjrQ==
X-Gm-Message-State: AC+VfDwvNgFS3XoSQVLiZf8ujV8RcOOQ0a+Z+fTJ0vvNz5xihj7v3vGM
	TILShPXJDdOcZC+ohjIdornJES05nl8UNxypQh/LC+5hJU9cvYd1xG7tKxN4D1FrJhKRD4sEGzg
	Iejn6tLGyQ+CPQ77V1ZoUQ9Ubup9oPSHnpg==
X-Received: by 2002:a05:6512:2e3:b0:4f1:26f5:7814 with SMTP id m3-20020a05651202e300b004f126f57814mr6424817lfq.20.1687196776193;
        Mon, 19 Jun 2023 10:46:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+4fxbFOo+f+Q5rzIV9HFhBJY1ZCXoDd3gMpB+0gLAGL1cS8ByROT88pWP0O7JR8aFPqx92g==
X-Received: by 2002:a05:6512:2e3:b0:4f1:26f5:7814 with SMTP id m3-20020a05651202e300b004f126f57814mr6424799lfq.20.1687196775873;
        Mon, 19 Jun 2023 10:46:15 -0700 (PDT)
Date: Mon, 19 Jun 2023 13:46:12 -0400
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
Message-ID: <20230619133754-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-5-parav@nvidia.com>
 <20230619124042-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481506017B439B07FC1253DDC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619132018-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7DD7654CF3B18939956DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D7DD7654CF3B18939956DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v6 4/4] transport-pci: Introduce group
 legacy group member config region access

On Mon, Jun 19, 2023 at 05:35:04PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, June 19, 2023 1:26 PM
> 
> > > > Also these devices will use non-transitional ID but they in fact do
> > > > have a legacy interface so using this definition they are
> > > > transitional devices. Maybe we need to add when we describe the
> > > > device ID text like "non transitional devices and transitional devices utilizing
> > commands XYZ" ...?
> > >
> > > Transitional device has specific meaning, I am not sure we should muddy it.
> > 
> > 
> > 
> > To simplify transition from these earlier draft interfaces, a device MAY
> > implement:
> > 
> > \begin{description}
> > \item[Transitional Device]
> >         a device supporting both drivers conforming to this
> >         specification, and allowing legacy drivers.
> > \end{description}
> > 
> > 
> > I agree it can be read this way. The issue is a lot of text in the spec just assumes
> > that "has legacy interface == transitional device".
> > 
> > 
> > 
> > For example:
> > When using the legacy interface the driver MAY access the device-specific
> > configuration region using any width accesses, and a transitional device MUST
> > present driver with the same results as when accessed using the ``natural''
> > access method (i.e.
> > 32-bit accesses for 32-bit fields, etc).
> > 
> > 
> > If we break the assumption we need to audit the spec for this
> > assumption and again, I really would rather not.
> 
> We are not breaking the assumption. Above listed requirement is already captured in the legacy interface conformance section.
> So I am not sure what extra to write here.
>  

Hmm not sure what's unclear.  I can try to explain the issue again.

These devices have a legacy interface yes?
So they should be transitional to avoid breaking assumption.


But they are not *exactly*
in that they don't have a transitional device ID.

At least the device id section needs extra text
then to explain this?

Or do you just want to make them have transitional ID?


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

