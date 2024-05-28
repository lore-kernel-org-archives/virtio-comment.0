Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B416FF5A
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716907160; cv=fail; b=p4Mz09XjIqdtRqY6X0oSD7ahAqxyCh5j+5j9j/A10Eye18jNRDSBQ9mfFziy4s6Qj/sWmTKBTBp8QGVrM+SBH7dflIZ5rM/7lcGpFe3eWtqWNdkBuNBRUQxjT5VRDF0jrDDXG29PLWuEng4whhF5d9gJ2PUxv6O3uQdLI5Ilhfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716907160; c=relaxed/simple;
	bh=tjG224G7dY5yBpGVmAX1kyc2ZtatS/8kPyug07l0xMQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=efguK4HcP6g+8hjIwsuOEgTV8nOs5QJ9GusasCn/OG75p+qljE8ukXXK+xcmKDQiO9q8BQX+d7gTOXDs5WhvN+Ch4UD/0a276zxE5Hdos31ogxIpw2wmNSAALleYTrlL2qYxlgywf304Md6On40dQxvxcwMaGo6s/DKvS957Qr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LaSk/M0v; arc=fail smtp.client-ip=40.107.212.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LaSk/M0v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSfruNgD4tjZOrPSzX6uzbHXEZow+TNBURZD+SniyHW9/diHg/owEJV56KLX7pBdXa0uVrx6Tkq/usYoi6e/xro2MbtaO2ZxI5wXrjqrk3NQv/4IJpTtslAXb+Cb8BtXOx1QQXA25n3ej4ZzQHaj5YpPPD1j5txOiJVarRXKAtvpiLwdjBUBhFdzJheCKxVNW0ijlgcSabFGxJe4+Tk4cog9Z93i0nSa/XjaQISTiel6zs/1D9oLhiyL/sMUYyx9IBm177lg0t4gIUQpOecoOn1c2dTqi2zCxKiWoymvuAmUK7l7YngnjLnV59qRg9wrR0WpRkirxeU+k1QEs85eWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+elhTta0fnEzFJQihWNDYJ1FGwMGheXpldgWWHprt0=;
 b=DcWH3LSblcF5zrzXM0iOe44kvtzHBOur+uNeYlT8P0inrlvvt+OksFVDsZZWvlCYa9EsJS9E5Z2zobpWuFLxtqFrLPzJSQZQTLK3F72wLpCdViamopNkRpkD1LYFsxR3cwSSien1tRw2xGCemntz/gEOErjfAsbBrYdRTwDjH5EbMr+rLVJfnap2uJDL/LCOpr2T2K5uZg4pZn+22zqDcO9Rrsi1xZ9Xsaqjjl0ulyfLKvX/CuFiaaRswb9EieoUNv2/p0DBu/xNJG0WNtTrNF5ky6HqWuWXCxhkAf44sQbYsXEvdT15EnDQ/ZIb91te6C4YMlD9X0igAFkbVTCofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+elhTta0fnEzFJQihWNDYJ1FGwMGheXpldgWWHprt0=;
 b=LaSk/M0vGBFU7L7CsboFLfOrk6p8MNKntzraFPmfkIgF/Ao0c7no9qkd/EcfgXrpIxqThkIlyC1QzTcVcXYYbMKO+W8f6XJ8hHFIyI6eh6bwEHtCseIqpQX/LSCL6ZaTCZ14kiNLnn36uGQzjzvuIEvvQsSZCyN9NWbQGpL2ZXGw5ozErFTCHk6QD8MwwAPOWVU4q3+Mg1Wm+4RS3VbiA7vcx9WMCCy8mBmWh71efuzHQSsbpAfh8JEih+HemkwkqUW3R4TQ3XdKn30D8eV0SdcScuS0wWWX8zXLnGXENBXQucLs3sRRjWjMsgSwzlX2bWqQWYdeSLSPZEW/iVD9/w==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH8PR12MB6794.namprd12.prod.outlook.com (2603:10b6:510:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 14:39:13 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 14:39:13 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>
Subject: RE: [RFC] Process to request a vote for an issue
Thread-Topic: [RFC] Process to request a vote for an issue
Thread-Index: AQHasP3AyMIVoq14sE6L5ccrkKI487GsmywggAAJDgCAAALKcIAACDyAgAAAaBA=
Date: Tue, 28 May 2024 14:39:13 +0000
Message-ID:
 <PH0PR12MB5481CBA7BDC42BFC9CF56E36DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <87plt6nlq4.fsf@redhat.com>
 <PH0PR12MB5481E79A58E5D2AF6ADEBE72DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87msoanjxx.fsf@redhat.com>
 <PH0PR12MB54813F8865CBD1A8F79EF510DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87jzjeni46.fsf@redhat.com>
In-Reply-To: <87jzjeni46.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH8PR12MB6794:EE_
x-ms-office365-filtering-correlation-id: 0e5d2b54-df5b-4179-d12a-08dc7f23f19f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?A2711DLhxn2dzbf/otjju8cKXO70FUDFDfyFK4eB+6LqZEl/Z2f/G2tdh5dO?=
 =?us-ascii?Q?1iwmNQDd6kiWIeeo4g/DEf6fVarUgxm9jxM3ZrMi+QTUbYBhTx14uO+AGHDe?=
 =?us-ascii?Q?iVMYRXY2SVgasDjMl6694EsVor5OodwInx/FpAlzX6wgEsFoR720KJ/0u5h/?=
 =?us-ascii?Q?UtVYbFgm1kj5kWzvMHCJoyV/Ki/YohaDsRrgzgh2BfCQIwAq7a2iwxIo8aQP?=
 =?us-ascii?Q?JG4EseD5qKxLow2Vy39q7to/dtu1e4dvZpwoLCzTHfbo5uR5brfmn+nnt5di?=
 =?us-ascii?Q?e6ljOf/Y9oDDtSC7AtkawRIeteeyuTtoCe40Hd+5DXGX0ct1NkPRyE8uHCT8?=
 =?us-ascii?Q?qW0OjMNxUiGpeI3bv2MEPE9vPAK1YY53t8w7PRyW1JJQ+te6fVIfPHC//hpG?=
 =?us-ascii?Q?IAVfw4PNJAGGeIDLemwwU6DCneptPDWCX/DqIWufjstxXx6sIgnn73k5UXsf?=
 =?us-ascii?Q?wztJ3FA69r+laTSDijAmlSeXKMkw/0duS7fsDj+dE2+o4HUeRa9ehvdPYXc3?=
 =?us-ascii?Q?Wvd8g0Khc7kASwGOcD3FoFUGmxgoySPRhsITBe4kkQNv2K36hEC1eXK8ZaNu?=
 =?us-ascii?Q?GmUlzm2SpkNvI9gg2eBkrxdowqQyEQzaDfb6X2prfStAQKFwuJO+gUTvm0hj?=
 =?us-ascii?Q?13rJnJ3I05bT7A/a+siDuzXFc3RQ/y71+5aB+q7TeRfzHVMDPUNTlyMkAsQI?=
 =?us-ascii?Q?nsd/o9wSkYX/okd1+jxbZEu8X9+/eaQZs6Q/UuIYB9/Mkgqd7ffAjANLwxSU?=
 =?us-ascii?Q?9o0adHaAmmYW5rUYqcJaorXlMPLEElZ7AWzd/Mbs1Dz7Av+LPwMx8zf0fd5u?=
 =?us-ascii?Q?GXbDQoZwI7E9uv2bAdPRucDErZukdojAwG2w/sldikqqUvxD77EDg3/F8hmG?=
 =?us-ascii?Q?cgJEe9C+oxtGrFR+QVkjil984xPIQ1+ALodiGjuJiXw65JNb5xTRuKWsAT0E?=
 =?us-ascii?Q?r3NypLSfh99NcTTPSsZ3sdxEjZbWtvy9oZWeDa9LBVMbxg2w0FywvEmfyDTN?=
 =?us-ascii?Q?XJqY77D2/HtwciGdq4+CACvPvEgxZM4O6/YAvejFSxtaZciwANI+t+qfxElj?=
 =?us-ascii?Q?K6Rqqb7SnEHU8n4k6t0TxVuFVa+qHRD33YVyDTctEP6Z15JpyUhpIWhNGsIa?=
 =?us-ascii?Q?nAq/i6hQTEvpGFcsJ/bwf/a+uS6s4nldZZcxnZlRGDck9Wn/BTIoiBEY1fU8?=
 =?us-ascii?Q?x1lD/CWSZ7Btfn7RimYUo7humZAbJwXu0VZs2Iz9VGWd0gkM9SEgkl7KykA5?=
 =?us-ascii?Q?UGa1qbBnAT9KCRUoJ4STh6fiwvobJ7DTfYRyWG22zH7gg68lG/66nm8ThdDO?=
 =?us-ascii?Q?jm5MqD+EeIkifWNtx7LiKzsVscvZTcoYDeyOpz8BmU+k+g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Yu+9KVC5T4hngSkp80iSSZEgvk9IhIVHp/7PbFl7oLXCUs8XfsQtrvwN4BNM?=
 =?us-ascii?Q?ln4J92MqRYFAlpyGbEhX+Grj12NeVeGdvGddxB1o6wzuBoNb/vTFuTlPrDzc?=
 =?us-ascii?Q?y66xyQgMvpwA3WyV/aNrttCVxRXFf/Ouy2kb7VwRQI7YY7AYC+F1pS7zPats?=
 =?us-ascii?Q?sAuwyxPsRl00knpWSrT+9oHQsqMwfMBnbm/1zma6OdoCXbnvE0r04Cl49T9H?=
 =?us-ascii?Q?A8AHp6W0oScGvtlub4xNMbte1+NTjMGdeJswfQ9O2Ly+fXq57P2EJhl0c5Vw?=
 =?us-ascii?Q?6pnl3rZT2WB/4PqO27zLcemufZsDrui/3Tn9SyKxoQjrAZg9Cb5PIq2CSAWm?=
 =?us-ascii?Q?xIxcWI4nyMkyc2B1Lal0ajoDA2FAPwrCfhNxxpf5QMXdnaKp9aLqBvuqTW+M?=
 =?us-ascii?Q?lsYSrJvQ40uZIWnrELKoSyHfyZACVq9ctLchFN2VaO0UbV0q1aMCAcL+0hut?=
 =?us-ascii?Q?DjYT+LHmOnmoULZtQn42fNkQTSQ4diu7Er457/sduOPUzvflMCNTRVHKQd58?=
 =?us-ascii?Q?K2vlPfW84CuJZn5hlFLbh/KXX/KvHnVjanLDHNiQcHr++Kp/0Wk6+aMdDBCD?=
 =?us-ascii?Q?hqmFSGJAjq4u3OAVfwYKyhOeNQsCbT1/9PLUgDdeEYDTv/ZGMUC0+ReBKcaL?=
 =?us-ascii?Q?37nsc+FSwpS8uIGQTEo5CBP1/D06lBmL4DWb8kEjaA9fMT1UkvC5NuOkY/Ld?=
 =?us-ascii?Q?hLFdBrssY/2PowF21RHA1yVqpvseOROoQwC0lK3w0MU7NZD58rc1CvPE2whE?=
 =?us-ascii?Q?PINKPyCdU7Ty1c25GbeMm1Dc2mi5gpFigQpq5tv8gD6QhfAxv0vf+ilazgI1?=
 =?us-ascii?Q?H8OCtmT3PLoy0Eb2o5qmIi8UaCe9JzKCrtHUNzhpFm9rY/xSyEuDusxnITE8?=
 =?us-ascii?Q?NtfM0WxjPoXbMndpqi0ln88Q3YKC5F34It20qzqVcunZ74tn4zP1Rrak3+vA?=
 =?us-ascii?Q?wmsyLpv2NLud/A6K7t/aTf+dbX+5gRlQqCfvp8zxHubSCQeRKL7IaDlGmQjC?=
 =?us-ascii?Q?oRovDlND55DAHYNVfIQ0ONr9ktQEqqwwJbe32N2/smlEeVYYpiL0d0xFzGkk?=
 =?us-ascii?Q?NCB8ZNdJ7K/aNTfvqC9ByY/0EFzNG4V8phjK80PFkiAXnmxMGSbpvWQ8y2Mm?=
 =?us-ascii?Q?MMejWpgzNNd7M9WjBw+KfM3NzqZBFMrcAN7XNPCTUvVF+Fl7UB+OH3Noc5u/?=
 =?us-ascii?Q?OvqXBTbb7XEur9Jco7XFFv9CcI/ekGxC76oZAqoA4vl3gCCTHB8PlbmKsMzK?=
 =?us-ascii?Q?4EmEQkQIvWuMzWgBu+GrZQ/K8hcXimnnFGmJbmkgGehvzx0VZTUhr4VWpy4a?=
 =?us-ascii?Q?R0H2k4S6SIJwf8qkWr0vL9GkUdsjYzw6gYTH+dr6L1KGOwmuUZXZMHqFQO1x?=
 =?us-ascii?Q?1kS+eoXc54HsKu+KjEa4ETTbeH4AIhA9T2fKkycSgIM2k6BOGCyfjEHCpiri?=
 =?us-ascii?Q?ZljajqShjbs/+wrqKij62e2+cCvQI7TngIkeCtisoSkCepyDQpuK586LWxv8?=
 =?us-ascii?Q?tDbbUQeRTj95IP7gyWqyCHgCPeNe1g8AT5aDBLF2A231X8TyPfcg0Vo18eWK?=
 =?us-ascii?Q?5pHq5vV03sBEE4lm6ss=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5d2b54-df5b-4179-d12a-08dc7f23f19f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 14:39:13.3917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HLAiJ4DmcaHGPyquGfpjrZaqnJme9U8z/IzHXN2R8SOC0I4/47fvTPqIVxhR1YHz9k3gkDWxurTn6cJ6L6Z6mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6794

> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, May 28, 2024 7:39 PM
>=20
> On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Tuesday, May 28, 2024 7:00 PM
> >>
> >> On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:
> >>
> >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> >> Sent: Tuesday, May 28, 2024 6:21 PM
>=20
> >> >> The last step currently mostly happens in the thread for the
> >> >> latest revision; such an email is easily missed if you're not
> >> >> actively following the
> >> discussion.
> >> >> IMHO it isn't a very reasonable expectation for the chairs to
> >> >> follow each and every discussion in detail; at some point, it is
> >> >> much more reasonable to expect trusted reviewers and SMEs to reach =
a
> consensus.
>=20
> Let's go back to the rationale here: Chairs should be able to find out ea=
sily
> which issues they should open a vote on. This involves trusting that thin=
gs
> have been found reasonable by people familiar with the topic.
>=20
Sure, however this solely is the request of the submitter to decide to ask =
for the vote.
If things are not acceptable, anyway vote wont progress.

> >> >>
> >> >> Therefore, I propose that
> >> >> - request for votes be posted in a new, separate thread, referring =
to
> >> >>   the version proposed for inclusion and
> >> > This looks good.
> >> >
> >> >> ideally containing a note on
> >> >>   who deems this proposal ready for inclusion,
> >> > This additional overhead does not seem necessary because when you
> >> > pull
> >> the patches using b4 tool.
> >> > It automatically captures who has reviewed, acked those patches
> >> > like any
> >> other email based flow.
> >>
> >> I disagree: This only captures people giving their R-b or A-b; not
> >> e.g. a SME saying "the hardware modeling looks good to me". A R-b
> >> from a trusted virtio reviewer is obviously a good indication that
> >> this is fine from a virtio perspective, but there's no way for Chairs
> >> to know each and every SME and judging how valuable the R-b or A-b of
> >> a person they do not know is. Just spell it out; "SME xyz says it
> >> looks good" is a reasonable statement to indicate readiness for a vote=
.
> >>
> > You are trying to define two things in this one process.
> > a. define process
> > b. defining SMEs
> >
> > doing #b in this process does not look right to me.
> > I wouldn't call it SMEs given that what you wrote above that "no way fo=
r
> chairs to know each and every SME"..
> > It is hard for non_chair to judge a person as SME or not. Seems broken =
there.
> > Rather to keep things neutral and simple, why not just say, reviewed by=
 or
> acked by person xyz?
>=20
> Again, it's not about "defining SME", I have no idea where you got this f=
rom.=20
Because you wrote the SMEs to write R-B or acked by.

> I
> just want the submitter to say "please open a vote for this,
> $PERSON_WORKING_ON_VIRTIO and $PERSON who knows the backend are
> happy with it." Nothing complicated, just an indication that it is reason=
able to
> open a ballot, trusting the submitter that they did any needed reviewing
> cycles, and trusting that the people who said that it looks good did thei=
r due
> diligence, and know what they are talking about. (Obviously, that's prima=
rily
> for more complex changes that touch areas that not everyone is familiar w=
ith,
> a simple patch with an R-b does not need elaborate justifications; just u=
se
> some judgement.)

Right. No need to attribute a person as SME or anything else.
Person abc signed-off and person xyx reviewed/acked.
Each information is present in last patch_N.
Submitter to just copy paste that again in the new request vote email.

TC already has voting committee to decide what to approve or not.
Virtio TC has consciously not added any formal or informal sub-committees f=
rom last year of any intermediate SMEs.
So, let's not complicate it now either.

To your point, "Chairs should be able to find out easily which issues they =
should open a vote on"

For any issue for which a diligent person has iterated the patches should h=
ave the right to ask for vote like today.
Virtio TC has the ability to evaluate it and vote.

If we need to discuss this more, than,

Defining "process to request a vote" seems like a committee work to happen =
on the OASIS-virtio@ConnectedCommunity.org mailing list.
Is virtio OASIS list still broken for you, hence discussion on this list?

While defining the new things is good, a humble request is, lot of patches =
are currently in waiting stage for several weeks to months now.
Starting with Heng's v5... and many of my patches.
To be clear, we don't want to wait for the new process to slow down the sna=
il further.

The new steps you mentioned are good to start as long as it is not blocking=
 patches already in the pipe.
