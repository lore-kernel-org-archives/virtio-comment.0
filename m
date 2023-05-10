Return-Path: <virtio-comment-return-5855-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAEDC7EE22
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 16:12:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CE943F3F5A
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 16:12:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C34F29866EA
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 16:12:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BB308986590; Wed, 10 May 2023 16:12:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA43D986591
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 May 2023 16:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zKnxMT_-NdisaTfkvNMXJw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683735124; x=1686327124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV1seWEpB1z4KZ5f5HR0o4/9t2SuHvHj5Ul3uAnb3PU=;
        b=kXXK6QsIARQnTCNDikM3YX6EGKQWsw85M81K7heu3e6xGshWSZDCPsCLwdFXsaJEzG
         fW7hoPqSxwrVwkbxmaS7wwclslvQdhY7f1/VRPvm82IfaM/JsWS2drwjajTrZivGFvgn
         3A4RRDgPA6gqqubnZwmzuvtyjHj+zWI3B21Py6z2EFa8AleGBSulqK80mc0apLEKOUz2
         ObkntyfT+fKK786bJXx5ExnOa7xmNJIr79Rd1YvRJ16oGqQ4C/rxKu768LQ8Ourwl5FV
         Lrz6JRpEtbju+VPflMbtdBeDirKnNF/ULJ7XX9NVRfReaWFKMPj506EHJfwXFp+Y2IkJ
         /jIQ==
X-Gm-Message-State: AC+VfDxXhST+CoszgFP64EQWNoInl2PjNrXPfS24FQu/bwFsHPJBqprM
	/jlmlN32ugYpHrbuzXe6w519VqgsZD9BXUEp6HoRYZvjjQp/n/aKt53V3SCHwaRICYnUKWgmXN/
	71v0cv7xJ6/FsjbaU4L15N/XjEZ0FAJ0MWw==
X-Received: by 2002:a7b:c7c3:0:b0:3f3:195b:d18c with SMTP id z3-20020a7bc7c3000000b003f3195bd18cmr11439669wmk.30.1683735124827;
        Wed, 10 May 2023 09:12:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5N3kvRrggkQA5FG2DRAMhm887wXf34WjD8cLyMfOKtqJmebwB/udG+oDLX+w3xT+PNoyK/Ew==
X-Received: by 2002:a7b:c7c3:0:b0:3f3:195b:d18c with SMTP id z3-20020a7bc7c3000000b003f3195bd18cmr11439653wmk.30.1683735124507;
        Wed, 10 May 2023 09:12:04 -0700 (PDT)
Date: Wed, 10 May 2023 12:11:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jiri Pirko <jiri@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230510121110-mutt-send-email-mst@kernel.org>
References: <cover.1683301091.git.mst@redhat.com>
 <ZFuqesg6YUSJi4dd@nanopsycho>
 <PH0PR12MB54814BF87CB79304EAAADC79DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54814BF87CB79304EAAADC79DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v13 00/10] Introduce device group and device management

On Wed, May 10, 2023 at 02:33:52PM +0000, Parav Pandit wrote:
> 
> > From: Jiri Pirko <jiri@nvidia.com>
> > Sent: Wednesday, May 10, 2023 10:30 AM
> 
> > 
> > Michael, not sure if it is problem of this patchset or on my side but makepdf
> > fails to build this. With master branch, works fine.
> 
> This patch fixes it.
> https://lore.kernel.org/virtio-comment/20230505163712.589460-1-parav@nvidia.com/
> 
> You can use b4 now to get this patch.

Thanks a lot, I will fold your patchset in when applying.

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

