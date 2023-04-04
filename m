Return-Path: <virtio-comment-return-5221-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A03C6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 14:37:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 14A272AD6C
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 14:37:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ECAFF986583
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 14:37:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D69B298640C; Tue,  4 Apr 2023 14:37:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C576998640E
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 14:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6CyKF7RmOrGX-qodxszviA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680619063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F2G5hOQM3lca8vmbGTumaGbXxbieJVc1+3iWtKUWxQ=;
        b=W9TyMzApc3EgJnoY3NfmYo3YXCJd7WsScQNRU3P1ZGJ0HwxhTq0JFlGpVQc+B4oWHG
         Q3Th/b4DKUcmksf2V4kB0eYIJrZcu+Qfr9PfxA3Rcx7COEub5mLUNIWEUezEFNBLOHa0
         bEuy8b5tYSQk0UVSo5ZOkhvxDGWXPdd3vJdaqa0zkJrRMnEVmYJ8yzWTFdYBGXf/bex7
         74MarT7AyMBh5rlT0q+mqD9slY6oI8XcJdLeTzHzGdVJk2yV+udSJdn6mKJEvtQLRmrA
         1qA/ibLvHWI8mIInPnqCs3CkspOivazKWi0sPUDWnHz0gJKuySODJT4AZiZ2Gvw04bJN
         p7+g==
X-Gm-Message-State: AAQBX9eaZERKXCbGpEUGMZmIBu5ZZ9bpeJZ8TujIUNQwKf8ufIyjgWtV
	x7gkSAur9JSIPfHeQRVx86kfquLVHJRXHXOmVNIE6VdkKt3Y7LutANpG7ZPM9tniqhfg/K0LwEw
	D/sDdW8sh5xKJjDbjBWpD55mZ96dxA1xt0A==
X-Received: by 2002:a17:907:6a11:b0:949:df4:2b36 with SMTP id rf17-20020a1709076a1100b009490df42b36mr2330870ejc.50.1680619063513;
        Tue, 04 Apr 2023 07:37:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350anaBzdRPKljaUhYU17TBp835E5h4huh5Pngr5PJsuWIhbjxMN1YkdHJRlDAProlOWLsPRHkg==
X-Received: by 2002:a17:907:6a11:b0:949:df4:2b36 with SMTP id rf17-20020a1709076a1100b009490df42b36mr2330853ejc.50.1680619063231;
        Tue, 04 Apr 2023 07:37:43 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:37:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230404102053-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <20230404032922-mutt-send-email-mst@kernel.org>
 <87jzysjd4g.fsf@redhat.com>
 <20230404084126-mutt-send-email-mst@kernel.org>
 <878rf7kcna.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <878rf7kcna.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 08/11] transport-pci: Introduce virtio extended capability

On Tue, Apr 04, 2023 at 03:19:53PM +0200, Cornelia Huck wrote:
> >> > What does it "Co-developed-by" mean exactly that Signed-off-by
> >> > does not?
> >> 
> >> AIUI, "Co-developed-by:" is more akin to a second "Author:", i.e. to
> >> give attribution. (Linux kernel rules actually state that any
> >> "Co-developed-by:" must be followed by a "Signed-off-by:" for that
> >> author, but we don't really do DCO here, the S-o-b is more of a
> >> convention.)
> >
> >
> > Actually, we might want to generally, to signify agreement to the IPR.
> > How about adding this to our rules?  But in this case Satananda Burla is
> > a TC member so yes, no problem.
> 
> Adding a s-o-b requirement is not a bad idea... do you want to propose
> an update?

OK how about the following:

---------------
The process for forwarding comments from others:

Generally, subscribing to the virtio comments mailing list
requires agreement to the OASIS feedback license, at
https://www.oasis-open.org/who/ipr/feedback_license.pdf

When forwarding (in modified or unmodified form) comments from others, please
make sure the commenter has read and agreed to the
feedback license. If this is the case, please include the following:

License-consent: commenter's name <commenter's email>

where commenter's name <commenter's email> is a valid
name-addr as specified in RFC 5322, see
https://datatracker.ietf.org/doc/html/rfc5322#section-3.4

If the comment is on behalf of an organization, please use the
organization's email address.


If forwarding a comment from a TC member, please instead get consent to
the full Virtio TC IPR, and then, as before, include

License-consent: commenter's name <commenter's email>

If you are reusing a comment that has already been posted to the
TC mailing list, the above tags are not required.

---------------

We could reuse Signed-off-by though I am a bit concerned whether
people will assume it's a DCO thing which everyone copies.
Thoughts?





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

