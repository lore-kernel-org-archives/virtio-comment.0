Return-Path: <virtio-comment-return-4802-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D473DC678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 15:09:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 320F83309F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 15:09:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0C1699866F6
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 15:09:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EAA7C9866EE; Wed,  8 Mar 2023 15:09:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D97429866EF
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 15:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2IkcY1yDOcu2zR6tbHxK9Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678287851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOm5iLTyvYuZkGNifsVKGabJV5p81xvJ7XKXqE55NuA=;
        b=wT77I16wj5cyJeHdJ/ycxgMKLYGFzAgHO1Ugq2FT8IA6+pwkNDTK1GdoynTyHkLMSk
         0mWPgYL3Ex4oLFrlU8MkGREkQzdCOP9QSJRWZFb7kpjheEonwvHbW9a1RR+nAyLmerVi
         1oWNSMvk9sNJMwU4dII3k/xd2dyOWuXQPalxEmCq/2Hs/i/ruLO6clm8qEh1KmL4agL5
         4h/dy0fQPjTFD1oWdQ9ZMqB4R9gk1ijj2sNG3FGlEB+K3s+wCrsQSu1fKd+GWMOS4AUX
         XfAesbL9f5diYf0buGcJ5YvJv++cCATHexzEHlAfci0vpE7dfXk4nJ5Lff14AHLmfVoe
         zucA==
X-Gm-Message-State: AO0yUKUbf9aE3GnH57wfXFHHm9Aq/ZzZGOw2MRkdIalw5ojYzvwv/xXE
	X6G1qdjvDgQ1Fcx1jiSNG19g1S+B53+MWBwKiX1i+ldRgfEw7Kq6wPgV/O9bsY0rnkl/eJkCZSf
	uAdJE/WP8VQi/dS2pqcH3dCR07Y4daEtqtw==
X-Received: by 2002:adf:e30d:0:b0:2ca:f86a:9643 with SMTP id b13-20020adfe30d000000b002caf86a9643mr12775061wrj.0.1678287850784;
        Wed, 08 Mar 2023 07:04:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8THxZbNAypBX0eNX63sSaBP4T22RG0SEQqvTx2BCqHbd7aKjiaM6PPNyeucewaAKYav+3LOg==
X-Received: by 2002:adf:e30d:0:b0:2ca:f86a:9643 with SMTP id b13-20020adfe30d000000b002caf86a9643mr12775028wrj.0.1678287850452;
        Wed, 08 Mar 2023 07:04:10 -0800 (PST)
Date: Wed, 8 Mar 2023 10:04:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: David Edmondson <david.edmondson@oracle.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, jasowang@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230308100357-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <0a784140387c2a592f7e1e7bbc5ae926ec5b45da.1677761896.git.mst@redhat.com>
 <m2leka0yvl.fsf@oracle.com>
 <20230306165907-mutt-send-email-mst@kernel.org>
 <m2r0u0zxkk.fsf@oracle.com>
 <87fsafl452.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fsafl452.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] [PATCH v10 01/10] virtio: document forward
 compatibility guarantees

On Wed, Mar 08, 2023 at 03:16:41PM +0100, Cornelia Huck wrote:
> On Tue, Mar 07 2023, David Edmondson <david.edmondson@oracle.com> wrote:
> 
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> >
> >> On Mon, Mar 06, 2023 at 01:53:50PM +0000, David Edmondson wrote:
> >>> "Michael S. Tsirkin" <mst@redhat.com> writes:
> >>> 
> >>> > Feature negotiation forms the basis of forward compatibility
> >>> > guarantees of virtio but has never been properly documented.
> >>> > Do it now.
> >>> >
> >>> > Suggested-by: Halil Pasic <pasic@linux.ibm.com>
> >>> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>> > ---
> >>> >  content.tex | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>> >  1 file changed, 42 insertions(+)
> >>> >
> >>> > diff --git a/content.tex b/content.tex
> >>> > index 0e474dd..0c2d917 100644
> >>> > --- a/content.tex
> >>> > +++ b/content.tex
> >>> > @@ -114,21 +114,63 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> >>> >  In particular, new fields in the device configuration space are
> >>> >  indicated by offering a new feature bit.
> >>> >  
> >>> > +To keep the feature negotiation mechanism extensible, it is important
> >>> > +that devices \em{do not} offer any feature bits that they would not be
> >>> > +able to handle if the driver accepted them (even though drivers are not
> >>> > +supposed to accept them in the first place even if offered, according to
> >>> > +this version of the specification.) 
> >>> 
> >>> I find this (the bit in parenthesis) confusing.
> >>> 
> >>> Why are drivers not supposed to accept features that they have been
> >>> offered, given that they can't know that the device cannot handle the
> >>> feature that it just offered?
> >>> 
> >>> Is this alluding to the later section:
> >>> 
> >>> > feature bits not described in this specification, reserved feature
> >>> > bits and feature bits reserved or not supported for the specific
> >>> > transport or the specific device type
> >>> 
> >>> ?
> >>
> >> exactly. how would you put this better? given an example?
> >
> > Perhaps it would be enough to say:
> >
> >> (even though drivers are not supposed to accept unrecognised features in
> >> the first place even if offered, according to the specification)
> >
> > "Unrecognised" is intended as a shorthand for the whole "not described,
> > reserved, ...". Maybe "unrecognised or reserved"?
> 
> Hm, what about
> 
> "even though drivers are not supposed to accept any unspecified,
> reserved, or unsupported features even if offered..."
> 
> ?

ok

> I'm not sure how we can make this both short and descriptive enough...



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

