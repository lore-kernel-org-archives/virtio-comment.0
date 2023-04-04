Return-Path: <virtio-comment-return-5215-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F78C761A6
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 12:43:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3C82D2B04E
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 12:43:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E9819863FE
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 12:43:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 067FF9863E4; Tue,  4 Apr 2023 12:43:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E830C9863E5
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 12:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vCmf4kT_M2iS5Jkvb2dUaw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680612216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCAXKP/Snwk0r7y93pfN0nz6yssYFNUrhdX7W0lWj8k=;
        b=io5rzhVKYjMTi7uqyVbchWz1J4QMxfiaMpfyPMbs0JZzWscZD1S9XXYlyZQqd1W1hC
         vt4q7j0p8GjmBlBqVj2zk08Fwh+ZHfOnL/ClJ3WPx5iTRvljwPkvTGfAgq35C0xrQLaW
         hdTWFLaHyPUwvzmpGpEg6l4rK2q8ji9LyRx+H1PE8EdDevpeDIHQcv/SB1t+WI7nW8BO
         O4gI5ektLEp5HssOpIXDxSdoYdESiAHRbgEpqDGg796Vw8eiNs7+74Q6NsnpbRJTPJoT
         8fsdYGopktm2o7vfpcFVVjcIxmchQVKkRhX1x8d3YD9599uWD99aApx7rv6rW+1UxgZD
         qGHw==
X-Gm-Message-State: AAQBX9cNNtuv2S1FwI3je8PxysApnrImeACHQgiWZ/A9Y3oFWOdUxdrd
	CD5oe2ntYLvS1iRdWdC1ZR39xjJJ7LyC71jLnrFrEVWKG46qVVBYSrx3VZAKmIIGusPuV/wSN+R
	EwkZ+nFWt/7tt6C3/SNrvMLdzN1r6x0wJFw==
X-Received: by 2002:a17:906:4943:b0:947:d9b1:89a1 with SMTP id f3-20020a170906494300b00947d9b189a1mr1958897ejt.44.1680612216522;
        Tue, 04 Apr 2023 05:43:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+VkEzGKsWLfXijf5BPpHK7SmyWKgr9n80ngusKGCx3vDBpA+91T+2wrL/dYXiBmUMdEK2DA==
X-Received: by 2002:a17:906:4943:b0:947:d9b1:89a1 with SMTP id f3-20020a170906494300b00947d9b189a1mr1958885ejt.44.1680612216281;
        Tue, 04 Apr 2023 05:43:36 -0700 (PDT)
Date: Tue, 4 Apr 2023 08:43:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230404084126-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <20230404032922-mutt-send-email-mst@kernel.org>
 <87jzysjd4g.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87jzysjd4g.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 08/11] transport-pci: Introduce virtio extended capability

On Tue, Apr 04, 2023 at 09:54:55AM +0200, Cornelia Huck wrote:
> On Tue, Apr 04 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Mar 31, 2023 at 01:58:31AM +0300, Parav Pandit wrote:
> >> PCI device configuration space for capabilities is limited to only 192
> >> bytes shared by many PCI capabilities of generic PCI device and virtio
> >> specific.
> >> 
> >> Hence, introduce virtio extended capability that uses PCI Express
> >> extended capability.
> >> Subsequent patch uses this virtio extended capability.
> >> 
> >> Co-developed-by: Satananda Burla <sburla@marvell.com>
> >
> > What does it "Co-developed-by" mean exactly that Signed-off-by
> > does not?
> 
> AIUI, "Co-developed-by:" is more akin to a second "Author:", i.e. to
> give attribution. (Linux kernel rules actually state that any
> "Co-developed-by:" must be followed by a "Signed-off-by:" for that
> author, but we don't really do DCO here, the S-o-b is more of a
> convention.)


Actually, we might want to generally, to signify agreement to the IPR.
How about adding this to our rules?  But in this case Satananda Burla is
a TC member so yes, no problem.

> >
> >
> >> Signed-off-by: Parav Pandit <parav@nvidia.com>


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

