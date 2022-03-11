Return-Path: <virtio-comment-return-2808-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1AA298660B
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Mar 2022 09:22:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <2478424.v7pibGEp8r@silver>
References: <2255414.aXzeqRvSCW@silver>
 <YioYtrSa0rX+nVMZ@stefanha-x1.localdomain> <87zglxhjre.fsf@redhat.com>
 <2478424.v7pibGEp8r@silver>
Date: Fri, 11 Mar 2022 10:21:54 +0100
Message-ID: <87o82chmj1.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to
 vq_info_block
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Mar 11 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 10. M=C3=A4rz 2022 17:09:25 CET Cornelia Huck wrote:
>> On Thu, Mar 10 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> > On Mon, Feb 21, 2022 at 06:01:41PM +0100, Christian Schoenebeck wrote:
>> >> This new CCW configuration field allows to negotiate a more fine
>> >> graded maximum lenght of indirect descriptor chains.
>> >>=20
>> >> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
>> >> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
>> >> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> >> ---
>> >>=20
>> >>  content.tex | 5 +++++
>> >>  1 file changed, 5 insertions(+)
>> >>=20
>> >> diff --git a/content.tex b/content.tex
>> >> index a3baf4d..d400ea7 100644
>> >> --- a/content.tex
>> >> +++ b/content.tex
>> >> @@ -2599,6 +2599,7 @@ \subsubsection{Configuring a
>> >> Virtqueue}\label{sec:Virtio Transport Options / Vir>>=20
>> >>          be16 num;
>> >>          be64 driver;
>> >>          be64 device;
>> >>=20
>> >> +        be32 indirect_num;
>> >>=20
>> >>  };
>> >>  \end{lstlisting}
>> >>=20
>> >> @@ -2607,6 +2608,10 @@ \subsubsection{Configuring a
>> >> Virtqueue}\label{sec:Virtio Transport Options / Vir>>=20
>> >>  available area and used area for queue \field{index}, respectively. =
The
>> >>  actual virtqueue size (number of allocated buffers) is transmitted i=
n
>> >>  \field{num}.>>=20
>> >> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then
>> >> \field{indirect_num} +reflects the maximum length of indirect descrip=
tor
>> >> tables for queue +\field{index}.
>> >=20
>> > I think the transfer direction of CCW_CMD_SET_VQ struct vq_info_block =
is
>> > driver-to-device. So it allows the driver to set the Queue Indirect
>> > Size, but how does the driver query the device's maximum Queue Indirec=
t
>> > Size value?
>>=20
>> [cc:ing Halil in case he has any further comments]
>>=20
>> You're right, CCW_CMD_SET_VQ + vq_info_block is driver-to-device. The
>> driver will obtain information about a queue via CCW_CMD_READ_VQ_CONF +
>> vq_config_block, so a max_indirect_num field needs to be added there as
>> well, I think.
>>=20
>> Moreover, we're changing the length of the ccw payload. Extending at the
>> end is generally fine, but the device and the driver need to agree on
>> what the expected payload is. We basically have two options here:
>>=20
>> * Make it depend on the feature bit being negotiated. This works because
>>   virtqueue discovery needs to be done only after feature negotiation
>>   has completed. However, this will get a bit awkward if we need to add
>>   another field depending on a new feature bit: negotiating that
>>   hypothetical feature would imply that the indirect num fields would be
>>   present, but not valid, if the indirect feature had not been
>>   negotiated. Not a showstopper, but looks a bit odd.
>> * Tie it to a new ccw revision (3) and make offering the feature bit
>>   dependant upon revision 3 or later being negotiated. This has the
>>   advantage that ccw revisions always build on each other (so no
>>   awkwardness for future extension) and the drawback of introducing
>>   another transport-specific prereq.
>>=20
>> If we can live with the possible awkwardness of future extensions, tying
>> the size of the structures to feature bits might be the preferable way.
>
> Really? My intuitive pick would rather be option 2 (CCW revision). But I'=
ll go=20
> for whatever the common opinion is on this CCW issue.

Either would work; that's why I'd like to have Halil's opinion as well.


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

