Return-Path: <virtio-comment-return-7481-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CDACE79A8
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 15:52:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 01EC11FF9C
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 15:52:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CEB5D98658D
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 15:52:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B6A62986553; Tue, 19 Sep 2023 15:52:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A832E986555
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 15:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BkjUf9zINuKjZ4YoUmSdrw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695138752; x=1695743552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbKVtehYcbhibKezgI6pJqBXoaPfzap/QyqXqux7Yww=;
        b=CuH2ze18azz14zGP/FOC/KBXgL2Cc8hkuniX993KHs03T2+hEPnJtn6SehYS67P9qJ
         rR7vwYiIR+Fiqz8E18d8eU3mC4DhBmAe3sIf3U0X31gglDsNFEqj6OG7SH54sSWcgYIf
         cJe4hfyMwc6GrMDOacr9JUUeJN9574xtTscE4uugIBNph91/voxkB6hUZQsaUOitxh+2
         5QW8VamoV+R3qnWyXaYv95dR2FRPDhVHJNbWAomvCWscJ26xEbursJFGZnGm/+MxW4Rd
         rzlpQPnZRvw5yIBCs82NHE/OVMwGVH34PJtQizhPPGg3wCAEP3U3DGsaKshpYMfHpZ5p
         GwIg==
X-Gm-Message-State: AOJu0Yxq8uq5d7LE0RY43S0CmH9F/urSktxshDwFDzLARwClW+E+rqeL
	90msgXqRgJDPst8TPih+4ZBsxIg//7kQtVYNQVsJfaFlGKSVphaQnofEeAQRYegY6ktpDjr/MGW
	ggS8sG4kHvF19XpvGN63XeA+icV7DL0uC8A==
X-Received: by 2002:a05:651c:120f:b0:2b6:e958:5700 with SMTP id i15-20020a05651c120f00b002b6e9585700mr10727847lja.4.1695138752074;
        Tue, 19 Sep 2023 08:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFExL0VFTDt27m3v0qN/oTbmVeVCWwmLTwYALUw2zvGNVbTihnRcR/krc3U2LcAu1qft36hhQ==
X-Received: by 2002:a05:651c:120f:b0:2b6:e958:5700 with SMTP id i15-20020a05651c120f00b002b6e9585700mr10727829lja.4.1695138751713;
        Tue, 19 Sep 2023 08:52:31 -0700 (PDT)
Date: Tue, 19 Sep 2023 11:52:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, jasowang@redhat.com
Message-ID: <20230919102250-mutt-send-email-mst@kernel.org>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <20230919054054-mutt-send-email-mst@kernel.org>
 <ZQmt0Z8lbPMuFzR+@fedora>
MIME-Version: 1.0
In-Reply-To: <ZQmt0Z8lbPMuFzR+@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: virtio-sound linux driver conformance to spec

On Tue, Sep 19, 2023 at 04:18:57PM +0200, Matias Ezequiel Vara Larsen wrote:
> On Tue, Sep 19, 2023 at 05:43:56AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Sep 13, 2023 at 05:04:24PM +0200, Matias Ezequiel Vara Larsen wrote:
> > > Hello,
> > > 
> > > This email is to report a behavior of the Linux virtio-sound driver that
> > > looks like it is not conforming to the VirtIO specification. The kernel
> > > driver is moving buffers from the used ring to the available ring
> > > without knowing if the content has been updated from the user. If the
> > > device picks up buffers from the available ring just after it is
> > > notified, it happens that the content is old.
> > 
> > Then, what happens, exactly? Do things still work?
> 
> We are currently developing a vhost-user backend for virtio-sound and
> what happens is that if the backend implementation decides to copy the
> content of a buffer from a request that just arrived to the available
> ring, it gets the old content thus reproducing some sections two times.
> For example, we observe that when issuing `aplay FrontLeft.wav`, we hear
> `Front, front left...`. To fix this issue, our current implementation
> delays reading from guest memory just until the audio engine requires.
> However, the first implementation shall also work since it is conforming
> to the specification.
> 
> Matias

Sounds like it. How hard is it to change the behaviour though?
Does it involve changing userspace?
Maybe we need to fix the spec after all...

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

