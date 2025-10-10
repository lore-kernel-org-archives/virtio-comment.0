Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640E212B31
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760102182; cv=none; b=WCht0sCBOaoFKjEpd+/mwVIc+Zm72aB2wYTJo8mpV2+RxriISii3Lmm0apAe+qmg6RXWu21ogeUJJrscLzn318KLkpCai3tIZGHq1X7S6v/FQvGrZT3xFay8HyRrvC5Q+XZjL1UXFxsduFyMBG61nIWBZPLrgp9zL6oZkz6sUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760102182; c=relaxed/simple;
	bh=EpMFoh8wpMh3Et2FX3Zr9mSAmpi6awdBZxnKsZK/VvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r829vne2VeHvNdyt2XVCkXTbWTDu+f5KMiNgfPjEtQLVyy/a22dHX78sSN0RGAQD+1MaCHD1Roc6scDW2IFyGhIkS2U6r78XBj0Dd5S2LLjhSv5CzpmZvc9nAogMEO3jfXVJQWRmsWOXidDNfoaiqxokg1WbyOp+dC1IiEtkIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Quwth/IH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Quwth/IH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760102177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHLg4WBJ6Qj6/7q9WIOM6FAyn3soW3d9eML8IjUIHpg=;
	b=Quwth/IHlKKiUl+UUsz1m9y8Y64bgdquMimNzPOIpDyJKKpbDAyk6uxBjBpD5n+DcypxvW
	t0pIjsSGSUN8ESMdW9ot7qSr405RHuu1XNHrx6LVGnjR1vBGrR7mqCKwe09mHFcOCqYQEg
	nozcFm8WS0QOr6iKybr44ToiHUzkzg4=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-UUuLWTTONNGhslRba0GKJQ-1; Fri, 10 Oct 2025 09:16:15 -0400
X-MC-Unique: UUuLWTTONNGhslRba0GKJQ-1
X-Mimecast-MFC-AGG-ID: UUuLWTTONNGhslRba0GKJQ_1760102175
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-90d62b06bbfso708479241.2
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 06:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760102175; x=1760706975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHLg4WBJ6Qj6/7q9WIOM6FAyn3soW3d9eML8IjUIHpg=;
        b=aHeZurJhUoo4i6GYPvmB647Xrli6AYR5O41t6mPawyeYr9MF9VxhxYwg2uXofHVmR8
         IZ3lRqRt/qOeGY3TSpoAqN5B/dFKTrbVv0Zkbjepv1Xh3L7eiQF68YA1pCyOJregWOrg
         T8CSi8RyKcsIYCPCBBeYl7EZfsp43EKsUQP9eEpaVjuZuLAryTF6d017McxHCpFFEmY4
         p/WMhd3sIiPoQLKP4vJChINxm7QvpSxGoKzTXPkVJtmzVysoUjAhm07T4tGTKxK1n7aT
         ZEObabV4OaKMnZkWGYI73v9zvwqrrr6QnwJvNAaldF0vtMXV2/JQ0CBwxhMW/Is7YWdi
         S5Jw==
X-Gm-Message-State: AOJu0YzHV7fz6VfBB0jchEmQpxhLPp4HiXMrt22NDW2hiLiQjv+UVYJu
	gAWjSd+asXu1qd7Og2cZlTzdAUbDd93LCLPPLiWmtUVRrj1GpEmSE6gHl5BTLA3ReVhXHonohXE
	jEawv86P41AUi+TJu6pKKFGKkEoZDDpUEIZ93My1E+Loj49lNGh7QBwreN9YU1eeL5qosE5FuBw
	QRp0g=
X-Gm-Gg: ASbGncuUdPT2rj5s+aM0ayQzBXZ4mOuJlhBimBWsZemHdS9n1Zz/hCpLtftdD+DPmRs
	rAwvfG2R1kxXt1U9kfbq2tf0udF0fOYQWf8cbARd+L+ylcxvdSvGfJ5CHyyHXT5k3QznH4S5xpJ
	pse5egQTZJBo4LhYRBnHwz5v4AhAU+543KpCxFsX/5NkIQ922fULdTapmJCSJIGP6a6HrGH1BMZ
	t2El+iIRU+pFISeMFf/fUw34K2vBuNAB1mtxHS8xEt1Sz5D85iMzdbotx4oZ3wJykLPT0Vdln57
	WT2r+htlUS0RNnHA1uQBEnru0/qoWw==
X-Received: by 2002:a05:6102:6202:20b0:5d5:f3c4:bda1 with SMTP id ada2fe7eead31-5d5f3c4c16dmr2291246137.28.1760102174524;
        Fri, 10 Oct 2025 06:16:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ1/ONzLA9sbhKmMZ9pCXdRnglXz0o6zaW8Afy2rGNVcJZK965VuWnNRsu7K13oK5ASkLWdQ==
X-Received: by 2002:a05:6102:6202:20b0:5d5:f3c4:bda1 with SMTP id ada2fe7eead31-5d5f3c4c16dmr2291084137.28.1760102173766;
        Fri, 10 Oct 2025 06:16:13 -0700 (PDT)
Received: from redhat.com ([45.88.222.114])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca39e9sm397275585a.40.2025.10.10.06.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:16:13 -0700 (PDT)
Date: Fri, 10 Oct 2025 09:16:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 08/10] make-setup-generated: optionally add GIT
 metadata
Message-ID: <20251010091214-mutt-send-email-mst@kernel.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
 <20251010112010.3880438-9-alex.bennee@linaro.org>
 <20251010074157-mutt-send-email-mst@kernel.org>
 <87ms5yx5q6.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ms5yx5q6.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qsm9Qa9Wok_cKM914eYKHH6ZMu8eXhkPfPZ7XeYhTxw_1760102175
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 10, 2025 at 02:10:25PM +0100, Alex Bennée wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Fri, Oct 10, 2025 at 12:20:08PM +0100, Alex Bennée wrote:
> <snip>
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Message-ID: <20251008145916.2626143-8-alex.bennee@linaro.org>
> >
> > Pls avoid Message-ID trailers in patches you post. It's really
> > confusing.
> 
> That was added by b4 - I can add a .b4-config to stop that happening
> accidentally. I see the git history has Links instead, e.g.:
> 
>  Link: https://lore.kernel.org/r/20250305164546.1484029-1-mvaralar@redhat.com
> 
> is that OK?



No, please don't add links for no point. Add a link if you are
linking to some relevant discussion.


When maintainers apply patches they can have b4 add
message id in b4 am/shazam command. It's not the default though
and that is maintainer flow not contributor flow.


Parav started adding these links automatically with -l, I personally
prefer -i so that links have meaning. Not worth my time
fighting about though.


> >
> >> ---
> >>  make-setup-generated.sh | 32 ++++++++++++++++++++++++++++----
> >>  makeall.sh              |  4 ++--
> >>  makehtml.sh             |  2 +-
> >>  makepdf.sh              |  2 +-
> >>  4 files changed, 32 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/make-setup-generated.sh b/make-setup-generated.sh
> >> index 2c5c7f8..8d33ac5 100755
> >> --- a/make-setup-generated.sh
> >> +++ b/make-setup-generated.sh
> >> @@ -1,16 +1,31 @@
> >>  #! /bin/sh
> >> +#
> >> +# Generate version and metadata preamble for the document
> >> +#
> >>  
> >>  DATESTR=${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
> >> -if [ x"$DATESTR" = x ]; then
> >> -    ISODATE=`git show --format=format:'%cd' --date=iso | head -n 1`
> >> -    DATESTR=`date -d "$DATE" +'%d %B %Y'`
> >> +
> >> +# If a second argument is passed we extract what we can from git
> >> +# metadata (closest lightweight tag) and local tree status. This
> >> +# allows locally generated copies to be tagged appropriately.
> >> +#
> >> +# The formal build process skips this.
> >> +if ! test -z "$2"; then
> >> +    TAG=$(git describe --dirty --tags)
> >> +    # base date on now
> >> +    DATESTR=$(date +'%d %B %Y')
> >> +    COMMIT=$(git rev-parse --short HEAD)
> >> +
> >> +    # Finally check if we have un-committed changes in the tree
> >> +    if ! git diff-index --quiet HEAD -- ; then
> >> +        COMMIT="$COMMIT with local changes"
> >> +    fi
> >>  fi
> >>  
> >>  case "$1" in
> >>      *-wd*)
> >>  	STAGE=wd
> >>  	STAGENAME="Working Draft"
> >> -	WORKINGDRAFT=`basename "$1" | sed 's/.*-wd//'`
> >>  	;;
> >>      *-os*)
> >>  	STAGE=os
> >
> > This is used in the generated latex:
> > make-setup-generated.sh:\newcommand{\virtioworkingdraft}{$WORKINGDRAFT}
> >
> > Are you sure output for a wd is unaffected?
> > We still need to be able to generate these for the TC process.
> >
> >
> >> @@ -41,6 +56,15 @@ esac
> >>  
> >>  VERSION=`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
> >>  
> >> +#
> >> +# Finally if we are building a local draft copy append the commit
> >> +# details to the end of the working draft
> >> +#
> >> +if ! test -z "$COMMIT" ; then
> >> +    STAGEEXTRATITLE="$STAGEEXTRATITLE (@ git $COMMIT)"
> >> +fi
> >> +
> >> +
> >>  #Prepend OASIS unless already there
> >>  case "$STAGENAME" in
> >>  	OASIS*)
> >> diff --git a/makeall.sh b/makeall.sh
> >> index 37e6c34..5f5d5dc 100755
> >> --- a/makeall.sh
> >> +++ b/makeall.sh
> >> @@ -3,8 +3,8 @@
> >>  export SPECDOC=${SPECDOC:-`cat REVISION`}
> >>  export DATESTR=${DATESTR:-`cat REVISION-DATE`}
> >>  ./makezip.sh
> >> -./makehtml.sh
> >> -./makepdf.sh
> >> +./makehtml.sh $1
> >> +./makepdf.sh $1
> >>  zip $SPECDOC.zip $SPECDOC.pdf
> >>  echo Generated file $SPECDOC.zip
> >>  echo To change output file name, set SPECDOC environment variable
> >> diff --git a/makehtml.sh b/makehtml.sh
> >> index 45b7080..cf1a8d7 100755
> >> --- a/makehtml.sh
> >> +++ b/makehtml.sh
> >> @@ -1,7 +1,7 @@
> >>  #!/bin/sh
> >>  
> >>  SPECDOC=${SPECDOC:-`cat REVISION`}
> >> -./make-setup-generated.sh "$SPECDOC"
> >> +./make-setup-generated.sh "$SPECDOC" $1
> >>  
> >>  cp virtio-html.tex $SPECDOC.tex
> >>  
> >> diff --git a/makepdf.sh b/makepdf.sh
> >> index 9cae903..bdfb8e5 100755
> >> --- a/makepdf.sh
> >> +++ b/makepdf.sh
> >> @@ -1,7 +1,7 @@
> >>  #!/bin/sh
> >>  
> >>  SPECDOC=${SPECDOC:-`cat REVISION`}
> >> -./make-setup-generated.sh "$SPECDOC"
> >> +./make-setup-generated.sh "$SPECDOC" $1
> >>  
> >>  rm $SPECDOC.aux $SPECDOC.pdf $SPECDOC.out
> >>  xelatex --jobname $SPECDOC virtio.tex
> >> -- 
> >> 2.47.3
> >> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

