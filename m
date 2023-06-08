Return-Path: <virtio-comment-return-6243-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F5CC7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:44:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4F2C7444C
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:44:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2BB81986676
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:44:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0DB0098666D; Thu,  8 Jun 2023 14:44:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC94898666B
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 14:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hAhBWauBMF-cYIyoLlmjcQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686235470; x=1688827470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAnHUrJr6+Ie9VBrwJ/il1em80oSecodhRGNUkuEV2U=;
        b=XEeJ36T/vqzTz5duKy0VbtMIoCVuIR1/cGcve33t49LzWpJ0JU20n+hy9e5OQ8axS9
         /yibSgHneIvmcSwznDcsrzv7uDVmOI3IcuaF/T+ly53l6rOZyAHVu1aPyhAyOwgL7Bty
         dV4Deg6kXMDvak+jK5Zl3eWKkj/jdWCruIvJ43W85WykeHeHeI0Fq7jRzzRrfApcHcon
         Zi0h2mJofFme/Oe5XMjyM7TXaHMYkmu6JEWHmh1iAsGrv9C/dbr4EOMD3XBKPCrSY02e
         vxDUFs2vM7/Vv12mpO5hRd1X+2LUCsUckEf9RVfMTnYKSWoklGIpgySEk4Bht4YVi8fo
         vavg==
X-Gm-Message-State: AC+VfDxOs8Fau9Tk/qD/+/lwtro6mXYGZJG+kTJjR3QtC8na8fHuxPxp
	Mkv76H9u61/siWxVsAHqPyZBKUgP+QvOAt4BXq4Ii9pmkKzSa+v0oBnf2Uc5U8DNZcn+Y3daMMs
	DqYBbCXg1g3bye5yxWe02Ng+EdEElCmQJCQ==
X-Received: by 2002:a7b:cbd3:0:b0:3f7:4961:52b6 with SMTP id n19-20020a7bcbd3000000b003f7496152b6mr1822299wmi.25.1686235469785;
        Thu, 08 Jun 2023 07:44:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62cPZMarvBu4yQzlpPRaeSaSKzMr/8mgFE/D/9Gy6fwNfON6OZTY4RLxDk5qHXR4L3nY4Y1w==
X-Received: by 2002:a7b:cbd3:0:b0:3f7:4961:52b6 with SMTP id n19-20020a7bcbd3000000b003f7496152b6mr1822284wmi.25.1686235469432;
        Thu, 08 Jun 2023 07:44:29 -0700 (PDT)
Date: Thu, 8 Jun 2023 10:44:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230608104215-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481C14D65D5E10CD23A9F67DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605092859-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org>
 <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
 <PH0PR12MB5481D80A48F3BD82D86B3DB0DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com>
 <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3] transport-pci: Introduce legacy
 registers access using AQ

On Thu, Jun 08, 2023 at 02:38:43PM +0000, Parav Pandit wrote:
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, June 7, 2023 2:54 AM
> 
> > Hypervisor can trap the legacy device configuration space write and convert it
> > to cvq commands.
> Michael already answered that cvq is not trapped; this is the main design goal we talked several times that it is passthrough device.
> 
> So no point discussing this again.
> 
> If you have any comments on v4, please let me know.
> 
> Both the design points are addressed in v4.
> 1. To split to two commands for device and config area
> 2. Use pci cap to learn about notification region
> 
> Since this ABI reflects what we agree on,
> I would want to raise for vote in coming days to be part of 1.3 in few days as we have more than 3 weeks to sort out non-ABI language part.

I think there's a bunch of work to tighten wording in v4, don't believe
it is ready for vote yet. Unfortunately I need to get ready for travel
and then travel for the kvm forum, during this time I will try but I
can't promise when I will be able to go over it in detail and send
comments. Back June 20.

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

