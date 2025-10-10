Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B52F0C5B
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101831; cv=none; b=rU/p6zH2eiu0XZoZg7C3eorZ0KF74B9s36K3H8Q2yn+2rotPHFmgzKSnDxbe/p4z5WnP3zBRL2nowgPX9aUDaM0bd1Mh2NWeBQWkyBuop2hxdkL8f3hQhUMUsagUW7r2jrOC3VPejpZXknAryfeN0UTesAMrBrwep/2aPsYo0OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101831; c=relaxed/simple;
	bh=MtrSoA/LRCtPhnNGYp0aR6/h3Sj8JBnt1E2MNZ2h5lQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q/3tBbhPjfDmxT57i839IHaDB04FvNw5hZ9Xn1knUJNwoSY5ExkS/dXcsL52Pes26hqn0g2oSiCv1uZTO2vqXQAM1cpWKgkgOq4uIuu3DPaUtXYDC9ipYFrAQYglXO2EOO1mSXUgoIbReX2G6pHD6vlS3IzgFKYKPtNiyCdHxhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OW8K9s10; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OW8K9s10"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3b27b50090so381348566b.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760101827; x=1760706627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Meej5K/OwQpKEqxVQocSxsw6rCv8uw9WON8JS6uuE/I=;
        b=OW8K9s10CdJylxkMC9OcRahsOZdN80JT7jZwE6LqCUTq9wWyKWR3tN4WSeWii8lX/5
         GHMn41xnI/R9Sj8FdmFn0C+JYNgfdVRx1V5JkFPUYUKU/xKEOntHFq88+11lAJgybwfZ
         D+40Efrb8/TpWNHWoNi3cDxSDtTB6B42j7M99qjCNQkWNYZJ/jY0JF26c03EyXGKqLSP
         6TkkUZkyuWQazRwDEqYecJPSq+Xbr8e+j9/JVQV1SQ9B2MjhJ5PmH1qONiZEHMjhEC0V
         Xe0flTTso0oxTzbt7R9OaxgI7pnT49/WH4wcuno1Lx7/UFqZpU3qTSQjf76LwGeacbpF
         v4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760101827; x=1760706627;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Meej5K/OwQpKEqxVQocSxsw6rCv8uw9WON8JS6uuE/I=;
        b=frZDa88/vkawwIKvrmEIxxccxOj1OVHlQbbrdMNkBf8s2Um6MEzay8TmUKv05MU8BD
         V5eehUxqK0dl7l4JfvToZmjtCUvRq4ISt4jZi8gzNe1yoYJeZXtrHAE5krrg95wxSt16
         x7N9GxA8Xs3ET2W8cnpOvP6CqC6MLlgg9pju69ysnPEmjTVJ25ekR17gid936wMTnoNa
         VyzMPaNuXu3Eah4XlOPiNK4zXk92JYdieOW1MEpJFeGLi+OSXIDX6lxiXukeg0NxExV0
         SMbID95jjcbIOVWpDKEUErDQ69JzSvCZIQdtrrvXvTY9zxToCtzIVIDWrSu5nfNoIH+1
         T6AQ==
X-Gm-Message-State: AOJu0Yyk0AMyqKxeD9AEHLgU36N3jZVTZ1naxErVia14d9ki4mFvjhyx
	4xmxwmSJN7CCLaA0J4txnJVz6mv31XPeISxKwsE9RQhATHY2PMQ9dEvxnNak11U5R7Rr+IiZVD6
	P/EOk
X-Gm-Gg: ASbGncubKS/OQZeoXD7GCL87YKkF4S0cK4IwkczZr1pYqb4j/l+58uhwdRiCsIC/+g0
	mpudL0LZslowjVuB5243IbDypjjkg325Xn/zy6HegE/57tCw84g6IwIIY542Yyqgc68ijKAMBBe
	Qialtj8qM+uAOAzXNV69mQQerLP41miApB15K78312e77PHAV7sRLJk8k9REHXDmU1hNbK+Movn
	I23bSRgZNPu2VJhqpGSnNoAZDBHj5ANPu7rlWnjdWpvIzxCDE7+HepsxS1fs1+1vNrppR4GmMjN
	QM/7KzFwSNTkyGACW983uyKF2g7P4K5GYIyPsK/x9LCS1Sb74WMZnzcLoIca2c1ByJm5eXbRzHg
	v0nHuYxSmhQt9GCuB5TSgF8t0sUDbeopuATwjTXBWFjeMUw==
X-Google-Smtp-Source: AGHT+IHsFmC3qDyyX4oqvT3l9weFMBFTjuLxufVjx0JucizpeL3gks99rIbrD+o6yqa03jiwpY0Y+Q==
X-Received: by 2002:a17:907:2d11:b0:b48:730:dbaf with SMTP id a640c23a62f3a-b50aaa9ad8amr1433888166b.25.1760101827265;
        Fri, 10 Oct 2025 06:10:27 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8dasm240880766b.4.2025.10.10.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:10:26 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 95E685F7F6;
	Fri, 10 Oct 2025 14:10:25 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 08/10] make-setup-generated: optionally add GIT metadata
In-Reply-To: <20251010074157-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Fri, 10 Oct 2025 07:52:24 -0400")
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
	<20251010112010.3880438-9-alex.bennee@linaro.org>
	<20251010074157-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Fri, 10 Oct 2025 14:10:25 +0100
Message-ID: <87ms5yx5q6.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Oct 10, 2025 at 12:20:08PM +0100, Alex Benn=C3=A9e wrote:
<snip>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-ID: <20251008145916.2626143-8-alex.bennee@linaro.org>
>
> Pls avoid Message-ID trailers in patches you post. It's really
> confusing.

That was added by b4 - I can add a .b4-config to stop that happening
accidentally. I see the git history has Links instead, e.g.:

 Link: https://lore.kernel.org/r/20250305164546.1484029-1-mvaralar@redhat.c=
om

is that OK?

>
>> ---
>>  make-setup-generated.sh | 32 ++++++++++++++++++++++++++++----
>>  makeall.sh              |  4 ++--
>>  makehtml.sh             |  2 +-
>>  makepdf.sh              |  2 +-
>>  4 files changed, 32 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/make-setup-generated.sh b/make-setup-generated.sh
>> index 2c5c7f8..8d33ac5 100755
>> --- a/make-setup-generated.sh
>> +++ b/make-setup-generated.sh
>> @@ -1,16 +1,31 @@
>>  #! /bin/sh
>> +#
>> +# Generate version and metadata preamble for the document
>> +#
>>=20=20
>>  DATESTR=3D${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
>> -if [ x"$DATESTR" =3D x ]; then
>> -    ISODATE=3D`git show --format=3Dformat:'%cd' --date=3Diso | head -n =
1`
>> -    DATESTR=3D`date -d "$DATE" +'%d %B %Y'`
>> +
>> +# If a second argument is passed we extract what we can from git
>> +# metadata (closest lightweight tag) and local tree status. This
>> +# allows locally generated copies to be tagged appropriately.
>> +#
>> +# The formal build process skips this.
>> +if ! test -z "$2"; then
>> +    TAG=3D$(git describe --dirty --tags)
>> +    # base date on now
>> +    DATESTR=3D$(date +'%d %B %Y')
>> +    COMMIT=3D$(git rev-parse --short HEAD)
>> +
>> +    # Finally check if we have un-committed changes in the tree
>> +    if ! git diff-index --quiet HEAD -- ; then
>> +        COMMIT=3D"$COMMIT with local changes"
>> +    fi
>>  fi
>>=20=20
>>  case "$1" in
>>      *-wd*)
>>  	STAGE=3Dwd
>>  	STAGENAME=3D"Working Draft"
>> -	WORKINGDRAFT=3D`basename "$1" | sed 's/.*-wd//'`
>>  	;;
>>      *-os*)
>>  	STAGE=3Dos
>
> This is used in the generated latex:
> make-setup-generated.sh:\newcommand{\virtioworkingdraft}{$WORKINGDRAFT}
>
> Are you sure output for a wd is unaffected?
> We still need to be able to generate these for the TC process.
>
>
>> @@ -41,6 +56,15 @@ esac
>>=20=20
>>  VERSION=3D`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
>>=20=20
>> +#
>> +# Finally if we are building a local draft copy append the commit
>> +# details to the end of the working draft
>> +#
>> +if ! test -z "$COMMIT" ; then
>> +    STAGEEXTRATITLE=3D"$STAGEEXTRATITLE (@ git $COMMIT)"
>> +fi
>> +
>> +
>>  #Prepend OASIS unless already there
>>  case "$STAGENAME" in
>>  	OASIS*)
>> diff --git a/makeall.sh b/makeall.sh
>> index 37e6c34..5f5d5dc 100755
>> --- a/makeall.sh
>> +++ b/makeall.sh
>> @@ -3,8 +3,8 @@
>>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}
>>  export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>>  ./makezip.sh
>> -./makehtml.sh
>> -./makepdf.sh
>> +./makehtml.sh $1
>> +./makepdf.sh $1
>>  zip $SPECDOC.zip $SPECDOC.pdf
>>  echo Generated file $SPECDOC.zip
>>  echo To change output file name, set SPECDOC environment variable
>> diff --git a/makehtml.sh b/makehtml.sh
>> index 45b7080..cf1a8d7 100755
>> --- a/makehtml.sh
>> +++ b/makehtml.sh
>> @@ -1,7 +1,7 @@
>>  #!/bin/sh
>>=20=20
>>  SPECDOC=3D${SPECDOC:-`cat REVISION`}
>> -./make-setup-generated.sh "$SPECDOC"
>> +./make-setup-generated.sh "$SPECDOC" $1
>>=20=20
>>  cp virtio-html.tex $SPECDOC.tex
>>=20=20
>> diff --git a/makepdf.sh b/makepdf.sh
>> index 9cae903..bdfb8e5 100755
>> --- a/makepdf.sh
>> +++ b/makepdf.sh
>> @@ -1,7 +1,7 @@
>>  #!/bin/sh
>>=20=20
>>  SPECDOC=3D${SPECDOC:-`cat REVISION`}
>> -./make-setup-generated.sh "$SPECDOC"
>> +./make-setup-generated.sh "$SPECDOC" $1
>>=20=20
>>  rm $SPECDOC.aux $SPECDOC.pdf $SPECDOC.out
>>  xelatex --jobname $SPECDOC virtio.tex
>> --=20
>> 2.47.3
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
