Return-Path: <virtio-comment-return-4897-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41571C6FD1D
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 15:00:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8170D42A66
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 15:00:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DAB6986412
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 15:00:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5E5C99863FC; Wed, 15 Mar 2023 15:00:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AC53986402
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Mar 2023 15:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Ze2WwLtCNPuxfFy2nbMDUQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678892416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDiID9kHLrgIeFo3E9PItCmx67iPY1YIaRDfBLWsE6U=;
        b=zpmiDNq9xZJXJaPFRXX43U69i/fo83HM58n9+6ccAjwvkVB2EmYI6W8FUoUEnbOsaA
         eu0oKJG0cwOZmiJU0OynCSz5n8jES8J11QW+NoCoMIcCLlQ36tVZjY6qd81MVomp41c9
         Pcc0U676O+nfbtSoK1oeaB027cBXcm4/7TgL/oKXFz24GXbVbdKR43p/ZLkzLowSObfQ
         CJNgZ/d0k7BtUzFzfTOV92ZU/0c3d/8MAVKstlUQVF/Uau2QqsrEglvvxh3MSA2tu6cU
         XbsM2BqHbHnefEVzK0JaDvTHE1QxUGG8cfDYLtWerbYrgaEeFIRk/lqvGwMBHTbemtTS
         cnQQ==
X-Gm-Message-State: AO0yUKVF03RVADzHTLo4Dz7Qqm4GE64Pb2W8N5cn0rQwbesAw2DKyYWL
	Tv6vKihK/+hTyj2G6tR/SAa31lGT4hFpXKbAVuv/+2LrXOc5CsBrjXIBMEzOAndufljjk7u+DWG
	2Au66q2xCtutWY15m49tThxpVTDokXN+pKA==
X-Received: by 2002:a05:600c:5107:b0:3df:e1e9:201d with SMTP id o7-20020a05600c510700b003dfe1e9201dmr17487109wms.40.1678892416225;
        Wed, 15 Mar 2023 08:00:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set/BRsyW6jlht/ZXJuoPmormJk8z4r2sd3ops5fVMIGZD1tLqSPWkMA+8PpsMrjl49i7C7A0tQ==
X-Received: by 2002:a05:600c:5107:b0:3df:e1e9:201d with SMTP id o7-20020a05600c510700b003dfe1e9201dmr17487086wms.40.1678892415965;
        Wed, 15 Mar 2023 08:00:15 -0700 (PDT)
Date: Wed, 15 Mar 2023 11:00:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230315110003-mutt-send-email-mst@kernel.org>
References: <20230223135205.175949-1-parav@nvidia.com>
 <Y/fQl7ImbYGHEtVY@fedora>
 <PH0PR12MB54812629987A9530712C0649DCB89@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54811AF45A8A935B17806632DCBF9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811AF45A8A935B17806632DCBF9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH] virtio-blk: Define dev cfg layout
 before its fields

On Wed, Mar 15, 2023 at 02:24:27PM +0000, Parav Pandit wrote:
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Parav Pandit
> > 
> > > From: Stefan Hajnoczi <stefanha@redhat.com>
> > > Sent: Thursday, February 23, 2023 3:46 PM
> > >
> > > On Thu, Feb 23, 2023 at 03:52:05PM +0200, Parav Pandit wrote:
> > > > Define device configuration layout structure before describing its
> > > > individual fields.
> > > >
> > > > This is an editorial change.
> > > >
> > > > Suggested-by: Cornelia Huck <cohuck@redhat.com>
> > > > Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  device-types/blk/description.tex | 95
> > 
> > [..]
> > 
> > > Yes, please!
> > >
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > Hi Cornelia,
> > 
> > Can you please merge this?
> 
> Any updates?

Pushed, thanks!



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

