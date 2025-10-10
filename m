Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE22848BF
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760097156; cv=none; b=HCV53joljU3ie7BuefPU6VOTFq8gH1GhCPwrEq1Wy8A4VWsT33H6CjCy81V+0QqEOuAe20tuQToVSpw5j0vkOullRKygwvEchrV4VqRzGFQVFIfvahM7Acy23/ddGnniL7jqMbmQZfsjtvNRRUEOB/DxdEVo5dYOyJ3Y1qxAubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760097156; c=relaxed/simple;
	bh=ifR1Uumyy1rdfZvXhomIu47jt1FvB3Q3965D1+brho8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UkthZ0BxFauszk36XszjnTciGKqX51QIIw3Zxv9LYXr5/x5iGFOIT6SfnJBXdf/z3geohHdkhEb3f7GmYbsLCzd97SZFBCJ1In5/h0bkHeYAI46OwtKOLT+BehMcMQgtB6tZkJDGrWEyckaubn+gYW8TzzuCARSTea7c5R0Ary8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qbpc9YrC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qbpc9YrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760097153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qgR7r5PajJzvcw/+Kuq6eu6RINyXlMOU2VBwHODhESU=;
	b=Qbpc9YrCpCOxtMsFO0klpzRYqBBopHfDCzlldKPH3mjH9sILUXWj9VVrQh5GVcb6wXBaRo
	n60niyIOJigMw2ExYGFJ/hq7qLFLSjHzFefPJrGeDYPG/8t5/Dy5cYhVafvJa31byPjY/l
	cTCObhtcDPwXRSmj8GDAIfpiLonUNds=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-NMBd5ki8N7abOQSg411kfg-1; Fri, 10 Oct 2025 07:52:29 -0400
X-MC-Unique: NMBd5ki8N7abOQSg411kfg-1
X-Mimecast-MFC-AGG-ID: NMBd5ki8N7abOQSg411kfg_1760097149
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b4068ff9c19so344018966b.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097148; x=1760701948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgR7r5PajJzvcw/+Kuq6eu6RINyXlMOU2VBwHODhESU=;
        b=wvhxJybso8bDD74qimXPfy4ODpt+5FKEwL1vwldgXvCmaNJcY+WfESnrULF4lnzlMZ
         iDfk7zDD16vGcCINo7B93XKdrj3JxVwXNB2WrrS4l6ZgOLmK0qPX1vLb849haZ7hGwKr
         QX/z/S6FmXBzPPaVDOYuv8DOWw0Ji1IROxtYuMmvArf5eiR2Ppwlf/1nYjpmBGDr1n6q
         8Wgk8LSFrrti4ZsxNeB7sDsvlTMuRWVSyLDxkrc7xMZUQ8Mg1SaQEw+P7svU+SDgCBwl
         s2tcmlnBmtYmI5CpZ/gnXKnF3tvE+R7MlFEYqT+TSOUZQD4hyBn2UYTNquz7ebyHQ5lG
         AyQg==
X-Gm-Message-State: AOJu0Yy0gC6vHNIRI6D4zcMvDX33ChAKV4f12IIKj4TfEngEDUI4/wpe
	79S5+aea1k3mRe1ZDbCZ0ck/O6Gy8Iu/HLqDZy6IjwNkl8zNM6HX/rkQpaKBOynRL0BHTV5Q05b
	m1wSMSc3yXh4bti14HkqLMaQYPvnhmbukPa5nOtAHPSYMjHquqxbAj7Q4Pqc8oZmRQP0kyQbcPJ
	C7vuU=
X-Gm-Gg: ASbGncsE8Eq8NhfjjcDWdjhd7u0XC29FrRPxuWT+jbzAKuJ8lONARmN4vH3nBiqK7cb
	T25GGfmWFtptZ2HB8DU3V3GQ85SEW/sxkMWzCSgT2nTOE6n86GmER7jueYjWqYKg33Z3ZICaMbC
	jBuz8qKo6ArQiATs7QQrUG9sA2x+kBMnyvVOk7O/zxI6zJIgOFD/s8wvHM4x7R1TqA3F+Fp9tDy
	Ld3CPuVe3eSGh2cNIADVon2tajWBXcPEgoJmvBNLHxJZEE84lWvYbYL9K/AC1WGmgI0MAfg9lfO
	lzMUd2MKjBm5Ad1opO5b+M/oE8jH
X-Received: by 2002:a17:907:cb07:b0:b56:bb0c:de4f with SMTP id a640c23a62f3a-b56bb0ce1ccmr74372666b.12.1760097148245;
        Fri, 10 Oct 2025 04:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhwUu2I8R/HUxwtCI0AcMSQMOEYU30YONoWtx0JYiOfk6ilnPnP8C1h1+amdQCHl1oDlCbiw==
X-Received: by 2002:a17:907:cb07:b0:b56:bb0c:de4f with SMTP id a640c23a62f3a-b56bb0ce1ccmr74369766b.12.1760097147682;
        Fri, 10 Oct 2025 04:52:27 -0700 (PDT)
Received: from redhat.com ([31.187.78.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad938sm216774866b.2.2025.10.10.04.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:52:27 -0700 (PDT)
Date: Fri, 10 Oct 2025 07:52:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 08/10] make-setup-generated: optionally add GIT
 metadata
Message-ID: <20251010074157-mutt-send-email-mst@kernel.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
 <20251010112010.3880438-9-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251010112010.3880438-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CArvVO6-7Oqe2nKebWqjxcl5zLKwxr5Fsw0PsnyV40g_1760097149
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 10, 2025 at 12:20:08PM +0100, Alex Bennée wrote:
> This isn't a full conversion to git based metadata but it allows for
> local builds to add git commit and tree status to the final built
> product. The normal formal build process is unaffected and uses
> manually updated VERSION, REVISION and REVISION-DATE metadata.

This violates oasis naming guidelines but I guess
as long as it is very clear this has no status beyond
a development help - okay I guess....

So what is the name format?


> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-ID: <20251008145916.2626143-8-alex.bennee@linaro.org>

Pls avoid Message-ID trailers in patches you post. It's really confusing.

> ---
>  make-setup-generated.sh | 32 ++++++++++++++++++++++++++++----
>  makeall.sh              |  4 ++--
>  makehtml.sh             |  2 +-
>  makepdf.sh              |  2 +-
>  4 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/make-setup-generated.sh b/make-setup-generated.sh
> index 2c5c7f8..8d33ac5 100755
> --- a/make-setup-generated.sh
> +++ b/make-setup-generated.sh
> @@ -1,16 +1,31 @@
>  #! /bin/sh
> +#
> +# Generate version and metadata preamble for the document
> +#
>  
>  DATESTR=${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
> -if [ x"$DATESTR" = x ]; then
> -    ISODATE=`git show --format=format:'%cd' --date=iso | head -n 1`
> -    DATESTR=`date -d "$DATE" +'%d %B %Y'`
> +
> +# If a second argument is passed we extract what we can from git
> +# metadata (closest lightweight tag) and local tree status. This
> +# allows locally generated copies to be tagged appropriately.
> +#
> +# The formal build process skips this.
> +if ! test -z "$2"; then
> +    TAG=$(git describe --dirty --tags)
> +    # base date on now
> +    DATESTR=$(date +'%d %B %Y')
> +    COMMIT=$(git rev-parse --short HEAD)
> +
> +    # Finally check if we have un-committed changes in the tree
> +    if ! git diff-index --quiet HEAD -- ; then
> +        COMMIT="$COMMIT with local changes"
> +    fi
>  fi
>  
>  case "$1" in
>      *-wd*)
>  	STAGE=wd
>  	STAGENAME="Working Draft"
> -	WORKINGDRAFT=`basename "$1" | sed 's/.*-wd//'`
>  	;;
>      *-os*)
>  	STAGE=os

This is used in the generated latex:
make-setup-generated.sh:\newcommand{\virtioworkingdraft}{$WORKINGDRAFT}

Are you sure output for a wd is unaffected?
We still need to be able to generate these for the TC process.


> @@ -41,6 +56,15 @@ esac
>  
>  VERSION=`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
>  
> +#
> +# Finally if we are building a local draft copy append the commit
> +# details to the end of the working draft
> +#
> +if ! test -z "$COMMIT" ; then
> +    STAGEEXTRATITLE="$STAGEEXTRATITLE (@ git $COMMIT)"
> +fi
> +
> +
>  #Prepend OASIS unless already there
>  case "$STAGENAME" in
>  	OASIS*)
> diff --git a/makeall.sh b/makeall.sh
> index 37e6c34..5f5d5dc 100755
> --- a/makeall.sh
> +++ b/makeall.sh
> @@ -3,8 +3,8 @@
>  export SPECDOC=${SPECDOC:-`cat REVISION`}
>  export DATESTR=${DATESTR:-`cat REVISION-DATE`}
>  ./makezip.sh
> -./makehtml.sh
> -./makepdf.sh
> +./makehtml.sh $1
> +./makepdf.sh $1
>  zip $SPECDOC.zip $SPECDOC.pdf
>  echo Generated file $SPECDOC.zip
>  echo To change output file name, set SPECDOC environment variable
> diff --git a/makehtml.sh b/makehtml.sh
> index 45b7080..cf1a8d7 100755
> --- a/makehtml.sh
> +++ b/makehtml.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  
>  SPECDOC=${SPECDOC:-`cat REVISION`}
> -./make-setup-generated.sh "$SPECDOC"
> +./make-setup-generated.sh "$SPECDOC" $1
>  
>  cp virtio-html.tex $SPECDOC.tex
>  
> diff --git a/makepdf.sh b/makepdf.sh
> index 9cae903..bdfb8e5 100755
> --- a/makepdf.sh
> +++ b/makepdf.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  
>  SPECDOC=${SPECDOC:-`cat REVISION`}
> -./make-setup-generated.sh "$SPECDOC"
> +./make-setup-generated.sh "$SPECDOC" $1
>  
>  rm $SPECDOC.aux $SPECDOC.pdf $SPECDOC.out
>  xelatex --jobname $SPECDOC virtio.tex
> -- 
> 2.47.3
> 

