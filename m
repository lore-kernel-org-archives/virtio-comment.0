Return-Path: <virtio-comment-return-9018-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09218C47DDB
	for <virtio-comment@archiver.kernel.org>; Fri, 26 Jan 2024 08:01:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 34473330B7
	for <virtio-comment@archiver.kernel.org>; Fri, 26 Jan 2024 08:01:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24AF998686E
	for <virtio-comment@archiver.kernel.org>; Fri, 26 Jan 2024 08:01:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 19A8F98685F; Fri, 26 Jan 2024 08:01:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08DBF986862
	for <virtio-comment@lists.oasis-open.org>; Fri, 26 Jan 2024 08:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WlaGSkH5NZCeJs0OrtYg-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706256076; x=1706860876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXimZfNwjPhYGgax7Th9a7MAq+8FMgfDeAwzsM2pXcI=;
        b=U5OaR8ZgIRc8c32fQXgeEXi3Bol841x7wU3AtaDeFA11gI7JW9aIocZBEp4A3c8ykb
         fb3kHHOKgmXIjIH5GMt0EdJ1TTC8BJM0LjyYAfbfZHFUQQ090nmdItdnnyGUk8AScVnt
         ekL6ZMr+RaqVtj4UfW8Aeeg5H7wCfXS2pr8LqfKvoAYTMJrO1rj3e/bA1x+q2dtHgTni
         ZjRQxwT5kaBav0ia1mpng2nJuhFIYoZAa79pccBR/CYRmHGBjajJMK5U4e4N8V+JvuBd
         AXIVg6Nkk/YEqfZCTH6Vvvwb+QR/bybECTfIabqtLsPVB7/ML4ieTEch/d0znbpDK6L2
         qIkA==
X-Gm-Message-State: AOJu0YxNfLtXqesoag0tR7Xp/mTXQldwqrbZ7BGOjqjeRPTP4XY9Ovm6
	frow3M0qW7LZgFWgM3sfgYLqyIisHOo4VUBdYsp7GSLSGty0YTdLcVjr2wQUBurctZM534fhcd+
	HUltUcTF7ObegXVhTn+JIM3QAa1B3LRK7HEY3uXVGETmZKlrrpTJkfFk7P2k4jlZOljfofnA=
X-Received: by 2002:a05:600c:19cd:b0:40e:d1da:3d17 with SMTP id u13-20020a05600c19cd00b0040ed1da3d17mr388300wmq.54.1706256075958;
        Fri, 26 Jan 2024 00:01:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmGpnsahyoy0ENIwp9xMhWNwVQZsFEe9+U5wd6b1FNoE8zbZgLflFuKIdgahuSMY2KcwPx9g==
X-Received: by 2002:a05:600c:19cd:b0:40e:d1da:3d17 with SMTP id u13-20020a05600c19cd00b0040ed1da3d17mr388292wmq.54.1706256075583;
        Fri, 26 Jan 2024 00:01:15 -0800 (PST)
Date: Fri, 26 Jan 2024 03:01:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20240126025730-mutt-send-email-mst@kernel.org>
References: <ff9a6d805e7d510cde77b9989bef90aa21ffe4b4.1706094950.git.mst@redhat.com>
 <PH0PR12MB5481FF7AED1F50D7066AC16ADC7B2@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FF7AED1F50D7066AC16ADC7B2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] [PATCH] virtio-net: clarify error handling for
 coalescing

On Wed, Jan 24, 2024 at 11:23:08AM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On Behalf Of
> > Michael S. Tsirkin
> > Sent: Wednesday, January 24, 2024 4:46 PM
> > To: virtio-comment@lists.oasis-open.org; virtio-dev@lists.oasis-open.org
> > Cc: virtio@lists.oasis-open.org
> 
> Can we please avoid posting to three different lists?

Yea I'll stop. Used to do it because of different archiving rules.
I'll stick to virtio-comment@lists.oasis-open.org


> > Subject: [virtio] [PATCH] virtio-net: clarify error handling for coalescing
> > 
> > This is not a huge deal since it's a SHOULD anyway, so make the new
> > requirement SHOULD too.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  device-types/net/description.tex | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex
> > index aff5e08..d1d25fe 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1792,7 +1792,11 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > 
> >  The device MUST ignore \field{reserved}.
> > 
> > -The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and
> > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if
> > it was not able to change the parameters.
> > +The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and
> > +VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR
> > if it was
> > +not able to change coalescing parameters. In this case, the parameters
> > +SHOULD remain unchanged, for all VQs.
> 
> Is the new added normative line without device is ok?
> 
> Or should it be written as
> ... In this case, the device SHOULD not update the parameters for all VQs.
> 
> ?

Your wording is confusing it can be intepreted to
mean just that not all parameters change but some might.
Generally we do not have to repeat "device" in each sentence.

> > +
> > 
> >  The device MUST respond to the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> > command with VIRTIO_NET_ERR if it was not able to change the parameters.
> > 
> > --
> > MST
> For the functionality itself, ignoring above normative suggestion,
> 
> Reviewed-by: Parav Pandit <parav@nvidia.com> 


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

