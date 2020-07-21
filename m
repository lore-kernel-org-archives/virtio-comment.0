Return-Path: virtio-comment-return-1356-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 80D7E985CAF
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jul 2020 11:04:10 +0000 (UTC)
References: <20200720145451.23883-1-alex.bennee@linaro.org>
 <20200721102721.GA172689@stefanha-x1.localdomain>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
In-reply-to: <20200721102721.GA172689@stefanha-x1.localdomain>
Date: Tue, 21 Jul 2020 12:04:06 +0100
Message-ID: <871rl5w2mx.fsf@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH] introduction.tex: introduce a glossary of terms
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Nikos Dragazis <ndragazis@arrikto.com>
List-ID: <virtio-comment.lists.oasis-open.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Mon, Jul 20, 2020 at 03:54:51PM +0100, Alex Benn=C3=A9e wrote:
>> It is useful to have a glossary of common terms at the front of the
>> document to define common terms we are going to use throughout the
>> specification. Whilst writing this list I notice we refer to a device
>> in host terms - perhaps we need slightly tighter definitions of what a
>> device is? For discussion I've defined a Device Interface in terms of
>> the guest visible side and a Device Backend in terms of what runs on
>> the host.
>>=20
>> Cc: Nikos Dragazis <ndragazis@arrikto.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  introduction.tex | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>=20
>> diff --git a/introduction.tex b/introduction.tex
>> index 33da3ec..c84a112 100644
>> --- a/introduction.tex
>> +++ b/introduction.tex
>> @@ -81,6 +81,36 @@ \section{Terminology}\label{Terminology}
>> =20
>>  The key words ``MUST'', ``MUST NOT'', ``REQUIRED'', ``SHALL'', ``SHALL =
NOT'', ``SHOULD'', ``SHOULD NOT'', ``RECOMMENDED'', ``MAY'', and ``OPTIONAL=
'' in this document are to be interpreted as described in \hyperref[intro:r=
fc2119]{[RFC2119]}.
>> =20
>> +\subsection{Glossary}\label{intro:Glossary}
>> +
>> +The following are definitions of common terms used throughout the speci=
fication.
>> +
>> +\begin{description}
>> +\item[Guest]
>> +  A virtual machine hosted by a hypervisor.
>> +\item[Host]
>> +  The system hosting a virtual machine. It may consist of multiple
>> +  components including a hypervisor, primary OS and it's user-space.
>
> Please avoid using guest/host terminology. Guest/host does not apply to
> all VIRTIO use cases. For example, the "device backend" definition above
> is specific to software implementation of VIRTIO devices on the host,
> but VIRTIO devices can be implemented in hardware too.
>
> Another example: it is possible to use VIRTIO devices on bare metal
> without virtualization in Linux (either hardware or software vDPA
> implementations).
>
> There are device types that are specifically designed for virtualization
> (e.g. memory ballooning) and there it is fine to use guest/host
> terminology. But the terminology should only be used when necessary and
> not as the base for defining general terms like "device" and "driver".

OK - I was hoping it would make things clearer as I was getting confused
with the device/driver terminology for the vhost-user-device.=20

>> +\item[Device Interface]
>> +  The series of configuration, control and operation mechanisms
>> +  visible to the guest that make a Virtio device.
>> +\item[Device Driver]
>> +  The software (usually part of a kernel) running on the guest which
>> +  accesses the device interface.
>> +\item[Device Backend]
>> +  The software running on the host that services requests made of the
>> +  device interface. The implementation details of the backend should
>> +  be transparent to the guest.
>
> The VIRTIO spec typically uses just "driver" and "device", not "device
> driver" and "device backend". Any instances of the latter should be
> fixed up in the spec.

OK how about:

  Device:

  The series of configuration, control and operation mechanisms
  visible to the driver that make up a Virtio device. The implementation
  of the device should be transparent to the Driver.

  Driver

  The software (usually part of a kernel) which accesses the device
  interface.


> Let's avoid using "backend" in VIRTIO because it already has a meaning
> in the context of vhost-user.
>
>> +\item[Notification]
>> +  An asynchronous signal sent to either the device backend or the
>> +  device driver to indicate a virtqueue has been updated. For guests
>> +  this is typically a device interrupt.
>
> The configuration change notification is not specific to a virtqueue.
> This definition should be more general:
>
> s/a virtqueue has been updated/an event has occurred/

OK - can we say anything else about it. Are notifications essential or
there to avoid polling.

>
>> +\item[Doorbell Register]
>> +  A guest visible register that when accessed will trigger a
>> +  notification to the backend via some implementation defined
>> +  mechanism.
>
> Rewriting this with the above points in mind:
>
>   A register that triggers a notification to the device when accessed by
>   the driver.
>
> Stefan



--=20
Alex Benn=C3=A9e

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

