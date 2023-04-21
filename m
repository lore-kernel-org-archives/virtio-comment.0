Return-Path: <virtio-comment-return-5566-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D0BC77B75
	for <virtio-comment@archiver.kernel.org>; Fri, 21 Apr 2023 05:37:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C74DD2AED1
	for <virtio-comment@archiver.kernel.org>; Fri, 21 Apr 2023 05:37:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A468F986644
	for <virtio-comment@archiver.kernel.org>; Fri, 21 Apr 2023 05:37:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8323A986636; Fri, 21 Apr 2023 05:37:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A8AD986637
	for <virtio-comment@lists.oasis-open.org>; Fri, 21 Apr 2023 05:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2SXAFIo5OIyuOqTh4T4p5w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682055456; x=1684647456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvj/tPDnWqWkpGKU+ZIAoggJv+IOb9ucBH1F/a6Fy4Q=;
        b=Cd11rCeWgzI7lL9ziA13bCs/xlhKdUHTCgdisvfuYomUFPqD62uBzTF500GWtwFbx1
         z7Ac6tnD9xihCgMb9oE1mPiiltGeHdarYJ5Jwfu/zyqzNwhTKlmxv8iZdjlQZ4Dg3cgK
         YiS8xLune/MOUknpan0sa7KYVRuguWE33f6HgsSw5wZu2cU1pxKHRYDJefncHSeRDdWd
         yi65dHws65K1dB5jhq++cLdKpcLcpJvsJzDn/qgZsV60LGUlm8cdsU95cup+vvoL5Nza
         S6jvFO1oQvuvQygePnT3wxha9WUWw5HJsEdtxhiFtvzpINJiyFDr8+fxNoFb+4mEQkQp
         ztcQ==
X-Gm-Message-State: AAQBX9c9jZvzTA85IBIo0sqBrFgRsukK3cIgvDz3V+QJYQfnEL9j5BB0
	VBjog+Ou8Jf3n72YKIjbCaWXT6PoLbr4+w0cBIN2c2c8iDmhz32Gylbj6ntOisgM5tay6s0pkLT
	2Zs4RXtEMct7cifB8dQvZBVWCo/jv+kcGIA==
X-Received: by 2002:a7b:cb8a:0:b0:3ee:1acd:b039 with SMTP id m10-20020a7bcb8a000000b003ee1acdb039mr809212wmi.34.1682055456755;
        Thu, 20 Apr 2023 22:37:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350buTzx0O1X98KYm7vSu5ry1DUtKYa1L9y34HsuwHRZXkoXJBz76mKRgqRh9INZM4LcAB2Y1lA==
X-Received: by 2002:a7b:cb8a:0:b0:3ee:1acd:b039 with SMTP id m10-20020a7bcb8a000000b003ee1acdb039mr809203wmi.34.1682055456499;
        Thu, 20 Apr 2023 22:37:36 -0700 (PDT)
Date: Fri, 21 Apr 2023 01:37:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230421013005-mutt-send-email-mst@kernel.org>
References: <20230420195158.69737-1-parav@nvidia.com>
 <20230420195158.69737-2-parav@nvidia.com>
 <20230420163800-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548172381252BEB73CAE6D44DC639@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548172381252BEB73CAE6D44DC639@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 1/2] transport-pci: Improve config msix
 vector description

On Thu, Apr 20, 2023 at 08:51:57PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, April 20, 2023 4:45 PM
> > >  \item[\field{config_msix_vector}]
> > > -        The driver sets the Configuration Vector for MSI-X.
> > > +        The driver writes the MSI-X table entry index in this field for
> > > +        Configuration change notification interrupts.
> > 
> > 
> > Urm not exactly. there is also a special value of 0xffff.
> > I feel this here is just a high level description.
> It is high-level description. 0xffff is already covered elsewhere in the doc.
> 
> > how about
> > 	Used by the driver to set the MSI-X vector for Configuration change
> > notification interrupts.
> > 
> > pci spec also calls the entry "the vector" so I feel it's ok.
> > 
> 
> To keep the text consistent with rest of the fields, how about
> 
> The driver writes the MSI-X table vector in this field for Configuration change notification interrupts.
> It uses a single verb instead two = "used" and "set".

well it's just "the MSI-X vector". not "table vector".
and personally I'd like something less verbose. yes Configuration isn't
really clear. and I dislike saying "this field" or "here" - it feels
repetetive ...


       Set by the driver to the MSI-X Vector for Configuration change notifications.

?


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

