Return-Path: <virtio-comment-return-2805-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 55D839865C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Mar 2022 16:10:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <YioYtrSa0rX+nVMZ@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver> <86604669.MZiAfaG04C@silver>
 <YioYtrSa0rX+nVMZ@stefanha-x1.localdomain>
Date: Thu, 10 Mar 2022 17:09:25 +0100
Message-ID: <87zglxhjre.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to
 vq_info_block
Content-Type: text/plain
To: Stefan Hajnoczi <stefanha@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Mar 10 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Feb 21, 2022 at 06:01:41PM +0100, Christian Schoenebeck wrote:
>> This new CCW configuration field allows to negotiate a more fine
>> graded maximum lenght of indirect descriptor chains.
>> 
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> ---
>>  content.tex | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/content.tex b/content.tex
>> index a3baf4d..d400ea7 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2599,6 +2599,7 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>>          be16 num;
>>          be64 driver;
>>          be64 device;
>> +        be32 indirect_num;
>>  };
>>  \end{lstlisting}
>>  
>> @@ -2607,6 +2608,10 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
>>  available area and used area for queue \field{index}, respectively. The actual
>>  virtqueue size (number of allocated buffers) is transmitted in \field{num}.
>>  
>> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then \field{indirect_num}
>> +reflects the maximum length of indirect descriptor tables for queue
>> +\field{index}.
>
> I think the transfer direction of CCW_CMD_SET_VQ struct vq_info_block is
> driver-to-device. So it allows the driver to set the Queue Indirect
> Size, but how does the driver query the device's maximum Queue Indirect
> Size value?

[cc:ing Halil in case he has any further comments]

You're right, CCW_CMD_SET_VQ + vq_info_block is driver-to-device. The
driver will obtain information about a queue via CCW_CMD_READ_VQ_CONF +
vq_config_block, so a max_indirect_num field needs to be added there as
well, I think.

Moreover, we're changing the length of the ccw payload. Extending at the
end is generally fine, but the device and the driver need to agree on
what the expected payload is. We basically have two options here:

* Make it depend on the feature bit being negotiated. This works because
  virtqueue discovery needs to be done only after feature negotiation
  has completed. However, this will get a bit awkward if we need to add
  another field depending on a new feature bit: negotiating that
  hypothetical feature would imply that the indirect num fields would be
  present, but not valid, if the indirect feature had not been
  negotiated. Not a showstopper, but looks a bit odd.
* Tie it to a new ccw revision (3) and make offering the feature bit
  dependant upon revision 3 or later being negotiated. This has the
  advantage that ccw revisions always build on each other (so no
  awkwardness for future extension) and the drawback of introducing
  another transport-specific prereq.

If we can live with the possible awkwardness of future extensions, tying
the size of the structures to feature bits might be the preferable way.


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

