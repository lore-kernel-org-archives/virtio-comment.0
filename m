Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAB5288535
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760104097; cv=none; b=fChKL77w22mpvtQKbhKty9KO1mzcX/MhbUYzuAqa1YWadX6SfpSKbrG1KTSd2SvmR0FiPEDBxzC4jwxdJQDS53YSrSn17kP/SHyObXg5HkMbT813BJzhDUiODTBF/bi/+HnXLMl1bI6B5kHZU67L+NfwhOXYvg3XDgcWbMuK6pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760104097; c=relaxed/simple;
	bh=gmIoNAGIiOIqs9MIkQ0xn/20BueyzRWzsabewEPaBSc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YUzGxoCMZ6PjXL8ib867tfHBzN7p3l2GK6cHWGOJ3aHRLwr/asfUjeyJVOURUVcudmX5TRxmpsJIEj5KZAdwpORdSv2snPQQisfTXdm4S3E1dOh8y5uECs8D++P6kRt2Lnh9q04oVkrtOCnZ8TCK1oLq9BsBmsqL0xY0Nr8lVeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwFMfXfK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwFMfXfK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4539dddd99so428885066b.1
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 06:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760104093; x=1760708893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC8yhwHQb8lXZtBiOOkeqMNOFnR9ImhOoBmyuWTsx1w=;
        b=IwFMfXfK2NNiLfb0c7MQKvSPrVJeyCkgTGuk/1CAONajVuBvdF+hzeJTBjB78CKeUO
         JPMebbs/AgFhteXeGP3xC7K59nR9GfBlgIrGa9dzqC5ZjQrmgPf4iltlscrwQu0+ROIp
         XGvty5rriOpHg57NEgoLlu21JOBFcqCIgR9AQtAdy7m4nxKVEmBkC1MEXwxSU2PaMYPG
         YtxTVM9HM2B4xKTOPdYKxWzXS1L/dw5Xyn+UU03zaSikxipVPn8g1CI9AEW6om9aI0Sa
         QOZGEbcbPPss8jhvlDbyHV1Llgd8MNwE1aLPnu/oHcTTCQclwrrdHZnFBRQSVaeX+csU
         6myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760104093; x=1760708893;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NC8yhwHQb8lXZtBiOOkeqMNOFnR9ImhOoBmyuWTsx1w=;
        b=N9n7MURuBH66h5koOEWYEVPFmqKBbmFLKWkkCEZeHjWqMSmGJ6buTuIZMqGlclGeWD
         grecei90lUW3oH0iW5cbZ9XsHMJxwiSXrnldfZmDmf4nfujAgh1QGcxiq9+FjoF6iRkN
         FVQAD9ArQQhauDwCZz1m3L6cEUE0BCai2CCM/RUhtpHv1MMQzZ4ulAdZ2crgeC4s4z05
         xwHCOfFulRRG6syDG+jlOUGkF5V2aLqaQVbVOvAzu1k8168/pIh6nfe3bqMYa/cT50Cs
         ao0/Bg2vyJFwf/9sZD7XM3Wse9g2+S88YQM87GgLpOmIIAN5FTASy6zIEO+dTqXaroZB
         v2Ug==
X-Gm-Message-State: AOJu0Yyevje+lwXs41R36p/CUy8Ft2Q4OMWqKxBN9ZRu1n9MS+QldYy9
	mc9JdPjVhpgT6S7+dQobuPEwKw/f8lXNzYRD7mHetXsmOfG4+K6RLSo6wflS7pMiQmhiMFNKQZi
	B0aCL
X-Gm-Gg: ASbGncuWH/ztKr5l39UfbObcm/vQhJgy7XbfArxVizwtCSvAkPIvcAiV/Q1AV04NnAs
	mea2roEYTMx7oNiGhUNrSG3tqWo+xk4JqPDAU9pj5RRqyZHDANahhMqhZQdFkmrok7Q6qpe2V7A
	W4CTPhLT4MoG3SJjO3Clx87+gib81TMAYLftv3ZuKW0xHeQzwDB7o3ukfa7jh6bnT+gvBBBcle3
	EOy+IuaLnk1sOyCNHYTyV9RjPQXADaVXnLg/J3nmTea+sd89So9dM8Hmf9cFDLunfuR7NHEMAED
	HYPvB/0BphDCrM6RdRLnQYNN5+oUP4INlF6Nfb1JzxGWzZW0ZIhsbnKYcAHOUt9u2jjVTa64uS6
	Y7Te3QIbv8hNDRAhPS+qQ6hJlBrKyOLIPrn7ajgSu752F1JtWWhtbaD4H
X-Google-Smtp-Source: AGHT+IEq/8xTI6D5JZL1AKMLnV1VQwMmQXGubwdCewFK0oXBU3A5RldJWlHeaKmcvpg5EY/hwKoNZQ==
X-Received: by 2002:a17:906:c146:b0:b49:a5e4:754a with SMTP id a640c23a62f3a-b50abfd027emr1245262566b.43.1760104092440;
        Fri, 10 Oct 2025 06:48:12 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900e151sm236982466b.68.2025.10.10.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:48:11 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CEFC95F7F6;
	Fri, 10 Oct 2025 14:48:10 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 08/10] make-setup-generated: optionally add GIT metadata
In-Reply-To: <20251010091214-mutt-send-email-mst@kernel.org> (Michael S.
	Tsirkin's message of "Fri, 10 Oct 2025 09:16:08 -0400")
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
	<20251010112010.3880438-9-alex.bennee@linaro.org>
	<20251010074157-mutt-send-email-mst@kernel.org>
	<87ms5yx5q6.fsf@draig.linaro.org>
	<20251010091214-mutt-send-email-mst@kernel.org>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Fri, 10 Oct 2025 14:48:10 +0100
Message-ID: <87bjmex3z9.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Oct 10, 2025 at 02:10:25PM +0100, Alex Benn=C3=A9e wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Fri, Oct 10, 2025 at 12:20:08PM +0100, Alex Benn=C3=A9e wrote:
>> <snip>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Message-ID: <20251008145916.2626143-8-alex.bennee@linaro.org>
>> >
>> > Pls avoid Message-ID trailers in patches you post. It's really
>> > confusing.
>>=20
>> That was added by b4 - I can add a .b4-config to stop that happening
>> accidentally. I see the git history has Links instead, e.g.:
>>=20
>>  Link: https://lore.kernel.org/r/20250305164546.1484029-1-mvaralar@redha=
t.com
>>=20
>> is that OK?
>
> No, please don't add links for no point. Add a link if you are
> linking to some relevant discussion.
>
> When maintainers apply patches they can have b4 add
> message id in b4 am/shazam command. It's not the default though
> and that is maintainer flow not contributor flow.

It turned out I had:

[am]
        messageid =3D true

in my global config. I've dropped that and made it local for repos now.

>
>
> Parav started adding these links automatically with -l, I personally
> prefer -i so that links have meaning. Not worth my time
> fighting about though.
>
>
>> >
>> >> ---
>> >>  make-setup-generated.sh | 32 ++++++++++++++++++++++++++++----
>> >>  makeall.sh              |  4 ++--
>> >>  makehtml.sh             |  2 +-
>> >>  makepdf.sh              |  2 +-
>> >>  4 files changed, 32 insertions(+), 8 deletions(-)
>> >>=20
>> >> diff --git a/make-setup-generated.sh b/make-setup-generated.sh
>> >> index 2c5c7f8..8d33ac5 100755
>> >> --- a/make-setup-generated.sh
>> >> +++ b/make-setup-generated.sh
>> >> @@ -1,16 +1,31 @@
>> >>  #! /bin/sh
>> >> +#
>> >> +# Generate version and metadata preamble for the document
>> >> +#
>> >>=20=20
>> >>  DATESTR=3D${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
>> >> -if [ x"$DATESTR" =3D x ]; then
>> >> -    ISODATE=3D`git show --format=3Dformat:'%cd' --date=3Diso | head =
-n 1`
>> >> -    DATESTR=3D`date -d "$DATE" +'%d %B %Y'`
>> >> +
>> >> +# If a second argument is passed we extract what we can from git
>> >> +# metadata (closest lightweight tag) and local tree status. This
>> >> +# allows locally generated copies to be tagged appropriately.
>> >> +#
>> >> +# The formal build process skips this.
>> >> +if ! test -z "$2"; then
>> >> +    TAG=3D$(git describe --dirty --tags)
>> >> +    # base date on now
>> >> +    DATESTR=3D$(date +'%d %B %Y')
>> >> +    COMMIT=3D$(git rev-parse --short HEAD)
>> >> +
>> >> +    # Finally check if we have un-committed changes in the tree
>> >> +    if ! git diff-index --quiet HEAD -- ; then
>> >> +        COMMIT=3D"$COMMIT with local changes"
>> >> +    fi
>> >>  fi
>> >>=20=20
>> >>  case "$1" in
>> >>      *-wd*)
>> >>  	STAGE=3Dwd
>> >>  	STAGENAME=3D"Working Draft"
>> >> -	WORKINGDRAFT=3D`basename "$1" | sed 's/.*-wd//'`
>> >>  	;;
>> >>      *-os*)
>> >>  	STAGE=3Dos
>> >
>> > This is used in the generated latex:
>> > make-setup-generated.sh:\newcommand{\virtioworkingdraft}{$WORKINGDRAFT}
>> >
>> > Are you sure output for a wd is unaffected?
>> > We still need to be able to generate these for the TC process.
>> >
>> >
>> >> @@ -41,6 +56,15 @@ esac
>> >>=20=20
>> >>  VERSION=3D`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
>> >>=20=20
>> >> +#
>> >> +# Finally if we are building a local draft copy append the commit
>> >> +# details to the end of the working draft
>> >> +#
>> >> +if ! test -z "$COMMIT" ; then
>> >> +    STAGEEXTRATITLE=3D"$STAGEEXTRATITLE (@ git $COMMIT)"
>> >> +fi
>> >> +
>> >> +
>> >>  #Prepend OASIS unless already there
>> >>  case "$STAGENAME" in
>> >>  	OASIS*)
>> >> diff --git a/makeall.sh b/makeall.sh
>> >> index 37e6c34..5f5d5dc 100755
>> >> --- a/makeall.sh
>> >> +++ b/makeall.sh
>> >> @@ -3,8 +3,8 @@
>> >>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}
>> >>  export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>> >>  ./makezip.sh
>> >> -./makehtml.sh
>> >> -./makepdf.sh
>> >> +./makehtml.sh $1
>> >> +./makepdf.sh $1
>> >>  zip $SPECDOC.zip $SPECDOC.pdf
>> >>  echo Generated file $SPECDOC.zip
>> >>  echo To change output file name, set SPECDOC environment variable
>> >> diff --git a/makehtml.sh b/makehtml.sh
>> >> index 45b7080..cf1a8d7 100755
>> >> --- a/makehtml.sh
>> >> +++ b/makehtml.sh
>> >> @@ -1,7 +1,7 @@
>> >>  #!/bin/sh
>> >>=20=20
>> >>  SPECDOC=3D${SPECDOC:-`cat REVISION`}
>> >> -./make-setup-generated.sh "$SPECDOC"
>> >> +./make-setup-generated.sh "$SPECDOC" $1
>> >>=20=20
>> >>  cp virtio-html.tex $SPECDOC.tex
>> >>=20=20
>> >> diff --git a/makepdf.sh b/makepdf.sh
>> >> index 9cae903..bdfb8e5 100755
>> >> --- a/makepdf.sh
>> >> +++ b/makepdf.sh
>> >> @@ -1,7 +1,7 @@
>> >>  #!/bin/sh
>> >>=20=20
>> >>  SPECDOC=3D${SPECDOC:-`cat REVISION`}
>> >> -./make-setup-generated.sh "$SPECDOC"
>> >> +./make-setup-generated.sh "$SPECDOC" $1
>> >>=20=20
>> >>  rm $SPECDOC.aux $SPECDOC.pdf $SPECDOC.out
>> >>  xelatex --jobname $SPECDOC virtio.tex
>> >> --=20
>> >> 2.47.3
>> >>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
