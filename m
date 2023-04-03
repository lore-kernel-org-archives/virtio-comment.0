Return-Path: <virtio-comment-return-5138-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0804FC761A6
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 14:50:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 46ACD6E6CE
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 14:50:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37B4098640C
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 14:50:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2CBC69863D6; Mon,  3 Apr 2023 14:50:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19CCB9863DF
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0iV3AnuIORK-6xopEz5dag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680533428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/tqcsvzRq6qiEKies2tam9Pc7iE2CWqbNdzW3AZFKg=;
        b=TP5TL9EFodGgBzs1C+eWuzK4xlXpqHPY0H9w60w0Go4ugm/fg80eFqBRw54WcoeKrZ
         l3MAsM475bjSnetaNbkrKbt9INJ5ufXLDhB04JWHkEeyPmyPoQ+ynfS/pcghSqSEmDQ3
         NlPYHJrIsOZi299VPHSnr5+dWZ7QxazAo2SJ3d4PiE035ibb9ZOVbZScm2tC2MSORGCD
         Miv52pmodS8zS9k4Om5AHzj+lj7vYjpcdKrlyChIKSfIl8YuZ5ZudPDtrjDCHQN3Q4xB
         6Z2Z/lps4GxmQM4501vT6nZxDaX7HbCM2Pr7UX5mGZC80Do8FhZiEcq1tpLhmx87WyAI
         yjPw==
X-Gm-Message-State: AAQBX9eq6TXNVQNItA4svGeggja5ix2NFED79Bb3VCol9sDEBIqUgss1
	W+5bWsjDhp79JA1fdk5oCqWuo5XIMXcPA0ElU2EG+v1H/UG6SmeZLPjaidnt7tmONeLTP/W1guc
	enpse+joxXiI2aHPWZtTcIj6vEJjYwZkBUg==
X-Received: by 2002:a17:906:5604:b0:921:da99:f39c with SMTP id f4-20020a170906560400b00921da99f39cmr39500354ejq.12.1680533428273;
        Mon, 03 Apr 2023 07:50:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350YXdDOe8pdMIlbpLXq5B79/dbVFX0PWmW6AMGJvAxjuWAuMCL5wJh0sBEQxMtBoV7VlGk7RQw==
X-Received: by 2002:a17:906:5604:b0:921:da99:f39c with SMTP id f4-20020a170906560400b00921da99f39cmr39500334ejq.12.1680533427985;
        Mon, 03 Apr 2023 07:50:27 -0700 (PDT)
Date: Mon, 3 Apr 2023 10:50:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230403104716-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-3-parav@nvidia.com>
 <20230331024233-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481977FD9EF430B891A1F3FDC8F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230402035420-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FEAA37D23191932F5C7FDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FEAA37D23191932F5C7FDC929@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 02/11] transport-pci: Move transitional device id to
 legacy section

On Mon, Apr 03, 2023 at 02:42:15PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, April 2, 2023 3:55 AM
> > 
> > On Fri, Mar 31, 2023 at 09:24:21PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, March 31, 2023 2:44 AM
> > > >
> > > > On Fri, Mar 31, 2023 at 01:58:25AM +0300, Parav Pandit wrote:
> > > > > Currently PCI device discovery details for the transitional device
> > > > > are documented in two different sections.
> > > > >
> > > > > For example, PCI device and vendor ID registers are documented in
> > > > > 'Device Requirements: PCI Device Discovery' section, while PCI
> > > > > revision id is documented in 'Legacy Interfaces: A Note on PCI
> > > > > Device Discovery' section.
> > > > >
> > > > > Transitional devices requirements should be documented in "legacy
> > > > > interfaces" section as clearly mentioned in 'Legacy Interface: A
> > > > > Note on Feature Bits'.
> > > >
> > > > I already commented on this, I disagree.
> > > > Modern drivers must be able
> > > > to completely ignore legacy interface sections, but they do bind to
> > > > transitional device IDs.
> > > > This change breaks this assumption.
> > > >
> > > Legacy interface section holds the detail about transitional devices.
> > > We do not have,
> > > "Legacy only" section.
> > >
> > > It doesn't make sense to partial information in legacy and partial in other
> > place.
> > > Modern drivers are not mentioned in the spec terminology section.
> > >
> > > Can you please explain, how can modern driver ignore the text " Transitional
> > devices MUST have a PCI Revision ID of 0." written in legacy interface section?
> > 
> > Modern drivers ignore revision ID. It is 0 to accommodate legacy drivers.
> For transitional device the revision ID must be zero and "a driver" miust check it be zero.
> The section refers to Legacy interface covering transitional devices (not just legacy device).
> So it cannot be written in spec from undefined modern driver POV in the spec.

No idea what all this means, sorry.  Please do not move text that
affects modern drivers to a legacy section. And we've spilled way too
much ink on this already.

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

