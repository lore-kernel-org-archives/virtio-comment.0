Return-Path: <virtio-return-3601-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <CACGkMEtb8P76pu0VM+B-Dt1BMi1edxv18BmAN0S6Z6_vHLHKSA@mail.gmail.com>
References: <20211011113828.309458-1-cohuck@redhat.com>
 <CACGkMEtb8P76pu0VM+B-Dt1BMi1edxv18BmAN0S6Z6_vHLHKSA@mail.gmail.com>
Date: Tue, 12 Oct 2021 13:16:45 +0200
Message-ID: <87sfx6wl0i.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio] Re: [PATCH] ccw: clarify device reset
Content-Type: text/plain
To: Jason Wang <jasowang@redhat.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Oct 12 2021, Jason Wang <jasowang@redhat.com> wrote:

> On Mon, Oct 11, 2021 at 7:38 PM Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> Unlike other transports, a reset triggered by the driver is actually
>> complete once the command has been completed. Make this behaviour
>> and the requirements more explicit.
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>
>> We have discussed this before while talking about reset behaviour,
>> but I don't remember sending an actual patch.
>>
>> If this looks good, I'll open an issue.
>>
>> ---
>>  conformance.tex |  2 ++
>>  content.tex     | 22 +++++++++++++++++++++-
>>  2 files changed, 23 insertions(+), 1 deletion(-)
>>

>> @@ -2775,8 +2775,28 @@ \subsubsection{Guest->Host Notification}\label{sec:Virtio Transport Options / Vi
>>  \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>>
>>  In order to reset a device, a driver sends the
>> -CCW_CMD_VDEV_RESET command.
>> +CCW_CMD_VDEV_RESET command. This command does not carry any payload.
>>
>> +The device signals completion of the reset operation by making the subchannel
>> +status pending to indicate successful completion of the channel command.
>
> Not familiar with ccw, but I wonder what's the meaning of "making the
> subchannel status pending"?

Hm, I was wondering whether I'm striking the balance between assuming
the reader knows the details of how channel I/O works and explaining the
basic flow...

Slightly simplified, if a device/control unit has finished processing a
channel program (whether successfully or not), it places some status in
the control blocks for the subchannel that serves as its communication
conduit, one of the values being "status pending". The driver may
collect the subchannel status at any time, but "status pending" in
particular means that an interrupt becomes pending. A system may run
with interrupts disabled, while still polling for pending interrupts, so
I did not want to write that the device generates an interrupt. Not sure
if this is now too hard to understand for someone not that familiar with
the matter, though.

>
>> +Notably, the command not only triggers the reset operation, but the reset
>> +operation is already completed when the operation concludes successfully.
>> +
>> +\devicenormative{\paragraph}{Resetting Devices}{Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>> +
>> +Before making the subchannel status pending to indicate successful completion
>> +of the reset command, the device MUST reinitialize \field{device status} to
>> +zero.
>
> Is the ordering of reinitialization and interrupt guaranteed by the transport?

It is definitely how it should be, i.e. the device performing the reset
and only then making the subchannel status pending. I had thought this
was self-evident, and QEMU also works like that, but maybe it really
needed some clarification. (I assume the zCX thingy also does it like
that, but I cannot check that myself.)

>
>> +
>> +The device MUST NOT send notifications or interact with the queues after
>> +it signaled successful completion of the reset command.
>> +
>> +\drivernormative{\paragraph}{Resetting Devices}{Virtio Transport Options / Virtio over channel I/O / Device Operation / Resetting Devices}
>> +
>> +The driver MAY consider the reset operation to be complete already after
>> +successful completion of the channel command, although it MAY also verify
>> +reset completion by reading \field{device status} via CCW_CMD_READ_STATUS
>> +afterwards.
>
> I wonder if it's better to say
>
> The driver MUST consider the reset operation to be complete by either ... or ...

We currently say that the driver SHOULD consider reset complete when it
reads back a zero status. For ccw, completion of the command is required
before the driver can issue another command (such as to check the device
status). What I wanted to say here is that the driver is already free to
consider the reset complete if the command was successful, but that it
can read back the status _after_ the reset command is through to satisfy
the generic SHOULD statement.


---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

