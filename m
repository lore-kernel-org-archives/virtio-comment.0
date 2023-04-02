Return-Path: <virtio-comment-return-5133-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBACC7619A
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Apr 2023 07:55:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7BD322A891
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Apr 2023 07:55:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC254986786
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Apr 2023 07:55:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8140D9865F7; Sun,  2 Apr 2023 07:55:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E2459863F0
	for <virtio-comment@lists.oasis-open.org>; Sun,  2 Apr 2023 07:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nyKCxSbXPA6QIHxNTbtrlg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680422099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZToUCdrF5oVL58PGOoAFHIspk/TTUDJwyri3NCOgmsw=;
        b=Io1FKozYDbZHx1xrV1UZGutlYWyqqiozBl18zYDFkviWp0X3r1GQ8AskOpt29aCkPX
         B0YYfg6KEGagpNeYhHdqGbdBbUALBJgi5qfH950Que2nRfXvtpttZID3EFklfhFEG72j
         Hy26ZfRZL3zZIBXtVTyzds/NCXm2jB0ChvGGKd2TZ/YDQM3AgEYhjv7E6msiUffUrx7C
         qmaQNeSMGRAC1FjvK2oN3c8U1OtSUbYKxEW49dtdef/OXUC5WpbIoMNU2O4mh/tUT/oq
         6QKAtrPA7m1p25Xin5u3kMgmCN5Vl8E1Ik/Q3KlGwS9L7FsEE+Xp0H3vPioEhKDkGFTp
         aW+A==
X-Gm-Message-State: AO0yUKWk/nlwyKAfCd5OQt+yty+4KPhXMx212WiJ2vzvaJLkT294bRHn
	d3n0N0erZVRV5YJjsmdRgKExMdTnx/AgIWYqo0myjKXi5igYQIA9Cas8PvI7/WFikfoYVl7OXlG
	xIHam4sQC27vUdXZdvhXnUrmaNlMF4so5Zg==
X-Received: by 2002:a1c:4b04:0:b0:3dc:5b88:e6dd with SMTP id y4-20020a1c4b04000000b003dc5b88e6ddmr25649916wma.10.1680422099488;
        Sun, 02 Apr 2023 00:54:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Ha0McUVP3+FMAQTF9k0tYE4gZLObgrEIVjaVtTfmslB2feB0Er/IZyGMCFXZ8Vs9RU/mxQA==
X-Received: by 2002:a1c:4b04:0:b0:3dc:5b88:e6dd with SMTP id y4-20020a1c4b04000000b003dc5b88e6ddmr25649908wma.10.1680422099150;
        Sun, 02 Apr 2023 00:54:59 -0700 (PDT)
Date: Sun, 2 Apr 2023 03:54:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230402035420-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-3-parav@nvidia.com>
 <20230331024233-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481977FD9EF430B891A1F3FDC8F9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481977FD9EF430B891A1F3FDC8F9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 02/11] transport-pci: Move transitional device id to
 legacy section

On Fri, Mar 31, 2023 at 09:24:21PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, March 31, 2023 2:44 AM
> > 
> > On Fri, Mar 31, 2023 at 01:58:25AM +0300, Parav Pandit wrote:
> > > Currently PCI device discovery details for the transitional device are
> > > documented in two different sections.
> > >
> > > For example, PCI device and vendor ID registers are documented in
> > > 'Device Requirements: PCI Device Discovery' section, while PCI
> > > revision id is documented in 'Legacy Interfaces: A Note on PCI Device
> > > Discovery' section.
> > >
> > > Transitional devices requirements should be documented in "legacy
> > > interfaces" section as clearly mentioned in 'Legacy Interface: A Note
> > > on Feature Bits'.
> > 
> > I already commented on this, I disagree.
> > Modern drivers must be able
> > to completely ignore legacy interface sections, but they do bind to transitional
> > device IDs.
> > This change breaks this assumption.
> > 
> Legacy interface section holds the detail about transitional devices.
> We do not have,
> "Legacy only" section.
> 
> It doesn't make sense to partial information in legacy and partial in other place.
> Modern drivers are not mentioned in the spec terminology section.
> 
> Can you please explain, how can modern driver ignore the text " Transitional devices MUST have a PCI Revision ID of 0." written in legacy interface section?

Modern drivers ignore revision ID. It is 0 to accomodate legacy drivers.

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

