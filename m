Return-Path: virtio-comment-return-1635-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BBB71986142
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Jan 2021 12:10:26 +0000 (UTC)
Content-Type: multipart/mixed; boundary="===============5641906774781885314=="
MIME-Version: 1.0
References: <20210112091611.19469-1-lauralg@amazon.com>
 <20210113113511.GG250553@stefanha-x1.localdomain>
From: Laura Loghin <lauralg@amazon.com>
Message-ID: <f32fb092-76a9-237b-3994-4d2e6363d6e6@amazon.com>
Date: Wed, 13 Jan 2021 14:10:10 +0200
MIME-Version: 1.0
In-Reply-To: <20210113113511.GG250553@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [PATCH] virtio-blk: clarify descriptor-segment relation
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--===============5641906774781885314==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BlOlurGDtQ0jaIfWQ8nl7CRmXwTkTsY9m"

--BlOlurGDtQ0jaIfWQ8nl7CRmXwTkTsY9m
Content-Type: multipart/mixed; boundary="kAkwnUqr39pmMMGQVHrILeoxGRGJBjNGI"

--kAkwnUqr39pmMMGQVHrILeoxGRGJBjNGI
Content-Type: multipart/alternative;
 boundary="------------C794355A22BCB49127320B5C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C794355A22BCB49127320B5C
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/13/21 1:35 PM, Stefan Hajnoczi wrote:
> On Tue, Jan 12, 2021 at 11:16:11AM +0200, Laura Loghin wrote:
>> Regarding the relation between data descriptors and segments, the
>> commit that added discard and write zeroes to the spec, stated that
>> the idea is "using 16 Bytes payload to support 1 descriptor" (not, for=

>> example, 32 bytes). There wasn't any mention in the spec about one dat=
a
>> descriptor corresponding to exactly one segment. Added this constraint=

>> to block documentation.
>>
>> Signed-off-by: Laura Loghin <lauralg@amazon.com>
>> ---
>>  content.tex | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 620c0e2..6393b68 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -4599,8 +4599,9 @@ \subsection{Device Operation}\label{sec:Device T=
ypes / Block Device / Device Ope
>>  of 512 bytes).
>> =20
>>  The \field{data} used for discard or write zeroes commands consists o=
f one or
>> -more segments.  The maximum number of segments is \field{max_discard_=
seg} for
>> -discard commands and \field{max_write_zeroes_seg} for write zeroes co=
mmands.
>> +more segments, and one data descriptor corresponds to exactly one suc=
h segment.
>> +The maximum number of segments is \field{max_discard_seg} for discard=
 commands
>> +and \field{max_write_zeroes_seg} for write zeroes commands.
>>  Each segment is of form:
> I'm not sure what this means, could you clarify?
>
> There is no concept of "descriptor" in virtio-blk write zeroes/discard.=

> There is only the "segment" (struct virtio_blk_discard_write_zeroes).
>
> If you are referring to vring descriptors, then there is no relationshi=
p
> between struct virtio_blk_req::data[] and vring descriptors. The driver=

> may choose any vring descriptor framing/layout (see 2.6.4 Message
> Framing).
>
> Stefan

Basically what I was trying to understand is if the specification enforce=
s/should enforce that
`len` field from a vring descriptor that is pointing to data that belongs=
 to a discard/write zeroes
command is always 16 bytes. So what you are saying is that something like=
:

struct virtq_desc {=20
=A0=A0=A0=A0=A0=A0=A0 /* Address (guest-physical). */=20
=A0=A0=A0=A0=A0=A0=A0 le64 addr;=20
=A0=A0=A0=A0=A0=A0=A0 /* Length. */=20
=A0=A0=A0=A0=A0=A0=A0 le32 32;=20
=A0=A0=A0=A0 ...
};

is totally legit for a virtq descriptor that belongs to a (large) discard=
/write zeroes request?
So this descriptor will point to a memory region where you have two virti=
o_blk_discard_write_zeroes
segments, one at `addr` address from above and the other one at `addr + 1=
6`.

Thanks!
Laura=20


--------------C794355A22BCB49127320B5C
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 1/13/21 1:35 PM, Stefan Hajnoczi
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20210113113511.GG250553@stefanha-x1.localdomain">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jan 12, 2021 at 11:1=
6:11AM +0200, Laura Loghin wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Regarding the relation bet=
ween data descriptors and segments, the
commit that added discard and write zeroes to the spec, stated that
the idea is "using 16 Bytes payload to support 1 descriptor" (not, for
example, 32 bytes). There wasn't any mention in the spec about one data
descriptor corresponding to exactly one segment. Added this constraint
to block documentation.

Signed-off-by: Laura Loghin <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:lauralg@amazon.com">&lt;lauralg@amazon.com&gt;</a>
---
 content.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 620c0e2..6393b68 100644
--- a/content.tex
+++ b/content.tex
@@ -4599,8 +4599,9 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
 of 512 bytes).
=20
 The \field{data} used for discard or write zeroes commands consists of o=
ne or
-more segments.  The maximum number of segments is \field{max_discard_seg=
} for
-discard commands and \field{max_write_zeroes_seg} for write zeroes comma=
nds.
+more segments, and one data descriptor corresponds to exactly one such s=
egment.
+The maximum number of segments is \field{max_discard_seg} for discard co=
mmands
+and \field{max_write_zeroes_seg} for write zeroes commands.
 Each segment is of form:
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I'm not sure what this means, could you clarify?

There is no concept of "descriptor" in virtio-blk write zeroes/discard.
There is only the "segment" (struct virtio_blk_discard_write_zeroes).

If you are referring to vring descriptors, then there is no relationship
between struct virtio_blk_req::data[] and vring descriptors. The driver
may choose any vring descriptor framing/layout (see 2.6.4 Message
Framing).

Stefan
</pre>
    </blockquote>
    <pre>Basically what I was trying to understand is if the specificatio=
n enforces/should enforce that
`len` field from a vring descriptor that is pointing to data that belongs=
 to a discard/write zeroes
command is always 16 bytes. So what you are saying is that something like=
:

struct virtq_desc {=20
=A0=A0=A0=A0=A0=A0=A0 /* Address (guest-physical). */=20
=A0=A0=A0=A0=A0=A0=A0 le64 addr;=20
=A0=A0=A0=A0=A0=A0=A0 /* Length. */=20
=A0=A0=A0=A0=A0=A0=A0 le32 32;=20
=A0=A0=A0=A0 ...
};

is totally legit for a virtq descriptor that belongs to a (large) discard=
/write zeroes request?
So this descriptor will point to a memory region where you have two virti=
o_blk_discard_write_zeroes
segments, one at `addr` address from above and the other one at `addr + 1=
6`.

Thanks!
Laura=20
</pre>
  </body>
</html>

--------------C794355A22BCB49127320B5C--

--kAkwnUqr39pmMMGQVHrILeoxGRGJBjNGI--

--BlOlurGDtQ0jaIfWQ8nl7CRmXwTkTsY9m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT7PPbkts+VacElquqr/JMIF4+ZggUCX/7jIgAKCRCr/JMIF4+Z
gq9jAQCJ5z7O8pu7NrVrmbeiU+SRUHrbBHv7wRKz0EVf27sK7gEA77QHkgvCafTM
XLHwdAzAU4U5dzYtzfiDYMINCHApSwg=
=KrpN
-----END PGP SIGNATURE-----

--BlOlurGDtQ0jaIfWQ8nl7CRmXwTkTsY9m--

--===============5641906774781885314==
Content-Type: multipart/alternative; boundary="===============1859529536466192350=="
MIME-Version: 1.0
Content-Disposition: inline

--===============1859529536466192350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.

--===============1859529536466192350==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<p></p>

<p><br>
Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.</p>

--===============1859529536466192350==--

--===============5641906774781885314==
Content-Type: text/plain; charset=us-ascii


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
--===============5641906774781885314==--

