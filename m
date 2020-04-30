Return-Path: virtio-comment-return-1203-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0163985A41
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Apr 2020 07:46:25 +0000 (UTC)
Date: Thu, 30 Apr 2020 03:46:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200430034518-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200327103803.10460-8-alex.bennee@linaro.org>
Subject: [virtio-comment] [mst@redhat.com: Re: [virtio-comment] [RFC PATCH  7/8] make*: remove
 reliance on REVISION-DATE and use git]
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Forgot to Cc list by mistake.
Apropos, please do not copy both virtio-dev and virtio-comment.
virtio-dev is for implementation, virtio-comment for spec feedback.

----- Forwarded message from "Michael S. Tsirkin" <mst@redhat.com> -----

Date: Thu, 30 Apr 2020 03:44:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Benn=E9e <alex.bennee@linaro.org>
Subject: Re: [virtio-comment] [RFC PATCH  7/8] make*: remove reliance on RE=
VISION-DATE and use git
Message-ID: <20200430034211-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200327103803.10460-8-alex.bennee@linaro.org>

On Fri, Mar 27, 2020 at 10:38:02AM +0000, Alex Benn=E9e wrote:
> Rather than manually tweaking REVISION-DATE and loading it into
> DATESTR move all the logic into make-setup-generated.sh. While we are
> at it we can query git directly for the state of tree and use that to
> fill in the meta-data.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>

I frankly find it more robust not to depend on current date,
git tags, or anything like this. People should be able to
generate exactly the same pdf/html from same sources without effort.
Additionally, it needs to be possible to build from tarball,
not just from git.

One exception where it's not possible ATM is
with redline, that requires git. Would be nice to fix.

> ---
>  REVISION-DATE           |  1 -
>  make-setup-generated.sh | 54 +++++++++++++++++++++++++++++------------
>  makeall.sh              |  1 -
>  makediff.sh             |  1 -
>  makediffall.sh          |  1 -
>  makediffwithbase.sh     |  1 -
>  maketex.sh              |  1 -
>  makezip.sh              |  2 --
>  8 files changed, 38 insertions(+), 24 deletions(-)
>  delete mode 100644 REVISION-DATE
>=20
> diff --git a/REVISION-DATE b/REVISION-DATE
> deleted file mode 100644
> index 59c9d17..0000000
> --- a/REVISION-DATE
> +++ /dev/null
> @@ -1 +0,0 @@
> -11 April 2019
> diff --git a/make-setup-generated.sh b/make-setup-generated.sh
> index f15d148..2faea0b 100755
> --- a/make-setup-generated.sh
> +++ b/make-setup-generated.sh
> @@ -1,39 +1,61 @@
>  #! /bin/sh
> +#
> +# Generate version and metadata preamble for the document
> +#
> =20
> -VERSION=3D1.1
> -DATESTR=3D${DATESTR:-`cat REVISION-DATE 2>/dev/null`}
> -if [ x"$DATESTR" =3D x ]; then
> -    ISODATE=3D`git show --format=3Dformat:'%cd' --date=3Diso | head -n 1=
`
> -    DATESTR=3D`date -d "$DATE" +'%d %B %Y'`
> +# Currently this works of the closest lightweight tag but we can
> +# update this when we start using proper signed and annotated tags.
> +TAG=3D$(git describe 2> /dev/null)
> +if [ x"$TAG" =3D x ]; then
> +    # no tag on head
> +    TAG=3D$(git describe --dirty --tags)
> +    # base date on now
> +    DATESTR=3D$(date +'%d %B %Y')
> +    COMMIT=3D$(git rev-parse --short HEAD)
> +else
> +    # base date on tag
> +    DATESTR=3D$(git log HEAD^..HEAD --format=3Dformat:"%cd" --date=3Dfor=
mat:"%d %B %Y")
> +    COMMIT=3D""
> +fi
> +
> +VERSION=3D$(cut -d'-' -f2 <<EOF
> +$TAG
> +EOF
> +       )
> +
> +# Finally check if we have un-committed changes in the tree
> +if git diff-index --quiet HEAD -- ; then
> +    COMMIT=3D"$COMMIT with local changes"
> +fi
> +
> +if [ x"$COMMIT" =3D x ]; then
> +    WORKINGDRAFT=3D""
> +else
> +    WORKINGDRAFT=3D" (@ git $COMMIT)"
>  fi
> =20
>  case "$1" in
>      *-wd*)
>  =09STAGE=3Dwd
>  =09STAGENAME=3D"Working Draft"
> -=09WORKINGDRAFT=3D`basename "$1" | sed 's/.*-wd//'`
>  =09;;
>      *-os*)
>  =09STAGE=3Dos
>  =09STAGENAME=3D"OASIS Standard"
> -=09WORKINGDRAFT=3D""
>  =09;;
>      *-csd*)
>  =09STAGE=3Dcsd
> -=09WORKINGDRAFT=3D`basename "$1" | sed 's/.*-csd//'`
> -=09STAGENAME=3D"Committee Specification Draft $WORKINGDRAFT"
> +=09STAGENAME=3D"Committee Specification Draft$WORKINGDRAFT"
>  =09;;
>      *-csprd*)
>  =09STAGE=3Dcsprd
> -=09WORKINGDRAFT=3D`basename "$1" | sed 's/.*-csprd//'`
> -=09STAGENAME=3D"Committee Specification Draft $WORKINGDRAFT"
> -=09STAGEEXTRATITLE=3D" / \newline Public Review Draft $WORKINGDRAFT"
> -=09STAGEEXTRA=3D" / Public Review Draft $WORKINGDRAFT"
> +=09STAGENAME=3D"Committee Specification Draft$WORKINGDRAFT"
> +=09STAGEEXTRATITLE=3D" / \newline Public Review Draft$WORKINGDRAFT"
> +=09STAGEEXTRA=3D" / Public Review Draft$WORKINGDRAFT"
>  =09;;
>      *-cs*)
>  =09STAGE=3Dcs
> -=09WORKINGDRAFT=3D`basename "$1" | sed 's/.*-cs//'`
> -=09STAGENAME=3D"Committee Specification $WORKINGDRAFT"
> +=09STAGENAME=3D"Committee Specification$WORKINGDRAFT"
>  =09;;
>      *)
>  =09echo Unknown doc type >&2
> @@ -54,7 +76,7 @@ cat > setup-generated.tex <<EOF
>  % define VIRTIO Working Draft number and date
>  \newcommand{\virtiorev}{$VERSION}
>  \newcommand{\virtioworkingdraftdate}{$DATESTR}
> -\newcommand{\virtioworkingdraft}{$WORKINGDRAFT}
> +\newcommand{\virtioworkingdraft}{$COMMIT}
>  \newcommand{\virtiodraftstage}{$STAGE}
>  \newcommand{\virtiodraftstageextra}{$STAGEEXTRA}
>  \newcommand{\virtiodraftstageextratitle}{$STAGEEXTRATITLE}
> diff --git a/makeall.sh b/makeall.sh
> index 37e6c34..1e25b82 100755
> --- a/makeall.sh
> +++ b/makeall.sh
> @@ -1,7 +1,6 @@
>  #!/bin/sh
> =20
>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}
> -export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>  ./makezip.sh
>  ./makehtml.sh
>  ./makepdf.sh
> diff --git a/makediff.sh b/makediff.sh
> index ef538c5..03f6731 100755
> --- a/makediff.sh
> +++ b/makediff.sh
> @@ -1,7 +1,6 @@
>  #force revision and date in environment
>  #this way they don't appear in the diff
>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}
> -export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>  export FROMVERSION=3D${FROMVERSION:-`cat DIFFVERSION`}
> =20
>  #make pdf diff using latexpand and latexdiff-fast
> diff --git a/makediffall.sh b/makediffall.sh
> index caff23e..f1a3333 100755
> --- a/makediffall.sh
> +++ b/makediffall.sh
> @@ -1,5 +1,4 @@
>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}
> -export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>  export FROMVERSION=3D${FROMVERSION:-`cat DIFFVERSION`}
>  ./makezip.sh
>  mv -f $SPECDOC.zip $SPECDOC-diff-from-${FROMVERSION}.pdf
> diff --git a/makediffwithbase.sh b/makediffwithbase.sh
> index 8cd3c7a..3916c83 100755
> --- a/makediffwithbase.sh
> +++ b/makediffwithbase.sh
> @@ -1,5 +1,4 @@
>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}
> -export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>  ./makezip.sh
>  ./makehtml.sh
>  ./makepdf.sh
> diff --git a/maketex.sh b/maketex.sh
> index c3b458f..1fee32b 100755
> --- a/maketex.sh
> +++ b/maketex.sh
> @@ -1,3 +1,2 @@
>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}-tex
> -export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>  ./makezip.sh
> diff --git a/makezip.sh b/makezip.sh
> index 806fa52..40b13cc 100755
> --- a/makezip.sh
> +++ b/makezip.sh
> @@ -1,5 +1,4 @@
>  export SPECDOC=3D${SPECDOC:-`cat REVISION`}
> -export DATESTR=3D${DATESTR:-`cat REVISION-DATE`}
>  rm -f $SPECDOC.zip
>  if test -d .git; then
>  =09git archive --format=3Dzip --prefix=3Dtex/ -o $SPECDOC.zip HEAD
> @@ -15,6 +14,5 @@ zip $SPECDOC.zip listings/virtio_queue.h
>  rm -fr tmpfilesforzip
>  mkdir -p tmpfilesforzip/tex
>  echo "$SPECDOC" > tmpfilesforzip/tex/REVISION
> -echo "$DATESTR" > tmpfilesforzip/tex/REVISION-DATE
>  cd tmpfilesforzip
>  zip ../$SPECDOC.zip tex/*
> --=20
> 2.20.1
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

----- End forwarded message -----


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

