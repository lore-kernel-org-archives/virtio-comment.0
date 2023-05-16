Return-Path: <virtio-comment-return-5935-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238EFC77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 05:54:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2E52B6004F
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 05:54:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25D4D986549
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 05:54:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 20870986510; Tue, 16 May 2023 05:54:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F218986511
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 05:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hfAOQs-8O3q-6ujCaINziQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684216451; x=1686808451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg9QQgBMH1lV5pUNbtYKH+0606liwJlMX4ITGACsQFc=;
        b=OCobe05VFnBadtJK52aEr6Ew/bvmwq+0YpC2aAnsj+xBpK58hFT41QIWd6debLNRGC
         0ldqKm2/zgF2MV/cEoj9nb/7TLeFNAm7QLFoHOVfVPfu9nRtZEZw81lBEKItOsxjWU6I
         oI0eppVGhb/vVfkOq+WcEDhzIIQaWJapYZ8fKSEJg7VcLcf51wR7RzslXXu8NQb5tYvS
         CYYb5MXA1e73Pt7ucexkKbXYM1mrm82vadz58/y95akuLWvbf7CwKkaLPQGB9PBG9TI6
         +FfzNKXrJ0C1r8i5/6KbT87WDG+wrijZ2pdOS/pROF/2Cm64EfkLHRqnhu/XNuFwwW+U
         xs9w==
X-Gm-Message-State: AC+VfDwE2gtTIEnuZqKxwZBF+HUrCOzwAkrjlj5DOejS6FF0B/wv0gOx
	aIKeiZguIq0SuB/G7U8Bo8um/SDPr9qkRvLu5fn2Qok0jyasm+7eU9korh+viisIR84hAwmopOB
	Fcodh7pvq2me0wiG3WD1dl3A1iD8i5XSqcA==
X-Received: by 2002:adf:facc:0:b0:306:30e8:eb34 with SMTP id a12-20020adffacc000000b0030630e8eb34mr27538346wrs.48.1684216451598;
        Mon, 15 May 2023 22:54:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7G1nR3ovlOAwnhI2o3JPrkgeVddI0nvQfDBzy+gj8Ob1iUDYrmyNzuDVSltLQI6qgeggD1JQ==
X-Received: by 2002:adf:facc:0:b0:306:30e8:eb34 with SMTP id a12-20020adffacc000000b0030630e8eb34mr27538341wrs.48.1684216451294;
        Mon, 15 May 2023 22:54:11 -0700 (PDT)
Date: Tue, 16 May 2023 01:54:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	virtio-dev@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230516013842-mutt-send-email-mst@kernel.org>
References: <20230516030139.767838-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230516030139.767838-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] content: Replace guest OS with driver

On Tue, May 16, 2023 at 06:01:39AM +0300, Parav Pandit wrote:
> Currently device status field description and driver requirements
> section uses mix of terminology for the driver. These two sections
> sometimes call the driver as 'the guest OS' or 'the driver'.
> 
> Most of the cleanup around 'guest Os' was already done around commit
> 212c0cf3 in past. Clean up the remaining few references to just
> refer it as 'driver'.
> 
> This is an editorial change.

No, editorial changes are things like formatting, correcting cross
references, resolving simple patch conflicts.  We also have a minor
cleanups rule including spelling and typos.  I feel we've been through
this discussion, no?

I'm insisting on clarifying this because you want to be an editor, and
we could benefit from more editors, but given editors have commit access
it's important to be clear what the role of an editor is, which is not
to make decisions about content - it's a technical role.


> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  content.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 9df81b8..417d476 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -26,10 +26,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  following bits are defined (listed below in the order in which
>  they would be typically set):
>  \begin{description}
> -\item[ACKNOWLEDGE (1)] Indicates that the guest OS has found the
> +\item[ACKNOWLEDGE (1)] Indicates that the driver has found the
>    device and recognized it as a valid virtio device.
>  
> -\item[DRIVER (2)] Indicates that the guest OS knows how to drive the
> +\item[DRIVER (2)] Indicates that the driver knows how to drive the
>    device.
>    \begin{note}
>      There could be a significant (or infinite) delay before setting

Actually, there is a subtle difference here that this is losing.
"guest OS" really refers to e.g. Linux virtio core code here.


ACKNOWLEDGE and DRIVER are used by virtio core.

ACKNOWLEDGE tells you virtio core attached to device, and DRIVER
tells you core found a device specific driver.



If you really want to make things better, let's find a way to explain
all this.





> @@ -473,13 +473,13 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
>  \begin{enumerate}
>  \item Reset the device.
>  
> -\item Set the ACKNOWLEDGE status bit: the guest OS has noticed the device.
> +\item Set the ACKNOWLEDGE status bit: the driver has noticed the device.
>  
> -\item Set the DRIVER status bit: the guest OS knows how to drive the device.
> +\item Set the DRIVER status bit: the driver knows how to drive the device.

besides the above, "drivers knows how to drive" sounds bad.

>  \item\label{itm:General Initialization And Device Operation /
>  Device Initialization / Read feature bits} Read device feature bits, and write the subset of feature bits
> -   understood by the OS and driver to the device.  During this step the
> +   understood by the driver to the device.  During this step the

Again the "the OS" here referred to core virtio (e.g. ring features).
Less of a problem to remove but if we come up with
a better terminology for ACKNOWLEDGE/DRIVER then I guess we can use it
here, too.


>     driver MAY read (but MUST NOT write) the device-specific configuration fields to check that it can support the device before accepting it.
>  
>  \item\label{itm:General Initialization And Device Operation / Device Initialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver MUST NOT accept
> -- 
> 2.26.2


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

