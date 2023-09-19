Return-Path: <virtio-comment-return-7479-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D38CD5BC6
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 14:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BC3A82CAE1
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 14:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A64E3986563
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 14:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 98B94986555; Tue, 19 Sep 2023 14:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7894F986553
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 14:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -UD4KldjM8WCSw7sdHAK-Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695133141; x=1695737941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHsPb4vwC+hSL0GCp3HRQ13LaXYANF8EE6mc0h6Oj8g=;
        b=ieT3nUv61VT0PPLWUlANQzsJrDvVTTY6TqTQ9n3hQEqZkEjmFthf1ATsM7Bz2eUf71
         TWtKtjYJ1NqbmrjzA7uUE/IIJDGl3CpD783ZeOG/viXFHraI2T5o8KA4DOOaBJwlcbsd
         618Gohu3kgNZ9v3VNuEa3dg/QEf26B6fcG09kelNy2D8vMHVyhrWuT1xH/pBrvmkI1qK
         gvNUHaDZjBHjU2uRv0U8gBPCsUN95sofExormdIS5xukOatJ+tjcc1kwdmqlQMadZoHx
         2siFLvdA/EWocbQEQgHIi0tLheBtoAnQTxCwMYK8GaSBR02jYjeFoUR2sZbb+nv2n4A/
         rq+g==
X-Gm-Message-State: AOJu0YyqhjkWDKqbZaIlc2qvWo9T5BK5VlZVGY8RuHV1KWh79kRXd7KD
	59tAAJj+2aWR+Mh1orPENtzTKnry0kzfHRKy7dGfAC7KU9wbcTtLUeY/GTzYWFg4pTEBYTlANx+
	QJkk9zvj9MC9j8937eCgXVySiIVuxzIDLIA==
X-Received: by 2002:a05:600c:2a4e:b0:401:c338:ab96 with SMTP id x14-20020a05600c2a4e00b00401c338ab96mr10435240wme.34.1695133140892;
        Tue, 19 Sep 2023 07:19:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHULrW8YH1mAvut0fZRQ8pHQtMqOvI3PTpgt45Tanm07z1GXdEHC8fUEBACgIXmq28KDQvcCw==
X-Received: by 2002:a05:600c:2a4e:b0:401:c338:ab96 with SMTP id x14-20020a05600c2a4e00b00401c338ab96mr10435220wme.34.1695133140545;
        Tue, 19 Sep 2023 07:19:00 -0700 (PDT)
Date: Tue, 19 Sep 2023 16:18:57 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, jasowang@redhat.com
Message-ID: <ZQmt0Z8lbPMuFzR+@fedora>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <20230919054054-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230919054054-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: virtio-sound linux driver conformance to spec

On Tue, Sep 19, 2023 at 05:43:56AM -0400, Michael S. Tsirkin wrote:
> On Wed, Sep 13, 2023 at 05:04:24PM +0200, Matias Ezequiel Vara Larsen wrote:
> > Hello,
> > 
> > This email is to report a behavior of the Linux virtio-sound driver that
> > looks like it is not conforming to the VirtIO specification. The kernel
> > driver is moving buffers from the used ring to the available ring
> > without knowing if the content has been updated from the user. If the
> > device picks up buffers from the available ring just after it is
> > notified, it happens that the content is old.
> 
> Then, what happens, exactly? Do things still work?

We are currently developing a vhost-user backend for virtio-sound and
what happens is that if the backend implementation decides to copy the
content of a buffer from a request that just arrived to the available
ring, it gets the old content thus reproducing some sections two times.
For example, we observe that when issuing `aplay FrontLeft.wav`, we hear
`Front, front left...`. To fix this issue, our current implementation
delays reading from guest memory just until the audio engine requires.
However, the first implementation shall also work since it is conforming
to the specification.

Matias


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

