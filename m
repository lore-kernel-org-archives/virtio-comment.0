Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361017C7B5
	for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719400051; cv=fail; b=dMDqw7QgyOhnoXfuYoQaREH4o8XsAIv7qjBl+5HTNOzws2p5NKeK55aXF56rc4xwgMYumVhGdGGNKyOfqQci7gVRDjJUWq6wQZeg3O3KXdAElridWEi4IRXa8R38HDTJf34fzj5amhzLeghgoz1zLhZYdPGPoRmVKI/aCJwsovI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719400051; c=relaxed/simple;
	bh=P2HPA2Oxz+Jd3aC3EKiN28KIGRxKd156GBcfB7ETMOg=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N/jWPXhd4uKEGHnOlP5NYZ6uudE7rpSLe1RNpLDAHAJt2vRUadrzyZAm2tYMI0THaQZK4clTY5zsxjlS6VsZfSCScU0YzDwFpwQttJcVA6zbt6+LVSdwTg5qbnWgclOTZfWgctX0MdxyG/6swum1gTxlxLFD76+zGVoYs0eBhks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=LV16l8yu; arc=fail smtp.client-ip=18.185.115.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="LV16l8yu"
Received: from 40.93.78.51_.trendmicro.com (unknown [172.21.180.199])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id E50DD10000D0F;
	Wed, 26 Jun 2024 11:07:20 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719400040.554000
X-TM-MAIL-UUID: 7232d44f-bcf0-47c4-9073-92f60433af40
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.51])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 8799810008264;
	Wed, 26 Jun 2024 11:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZlTpPWzY5isZWJ+RtyCRZWTS/t5P1OoMx6nV7Q8wmGnB3SGsWaYAmdKfX1KKyOApiJzk9OzTUaYsOnstTtp2eR1hzQ3o6W3hGylblGxE9VhXxnmN+15mSc2SqeMHhy22VaMepbnevXcXdVYXUI25iifiC8HHqcNQG4oVjwlYwhqXkA2IGB6cOGvgIhHZo8im/2bWYKyBOTTR1gZQ6N6nqqwihYGnqQxdA9LLG+eqFk+tpHottPyxm3n5i6IHMMqw9+Qg99E7RfddT2laFE8i95PMyK+/ah9dJb2l0Mw3KQCE2647nnhryemIlQBR23PHiZHF7LNyfWVuVlwSCNYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2b7Wsp4GwWMH9+yAwncKoN3X7kXOh3v8MQF83GteA8=;
 b=ag0W0Esc+1IdMuptshP9YWd9LgazG14FCTKnILsCxg/pQ2Av54NTdZvpW2SmLqsO09bGZUulY4CasYQowgDrbYxpINp5slg+mkFJUskD6gxPsDp/Mp6EfWOM7OmbeX1TOkBMVU8SsQAGdrlUST63K1KqN+Rx0QLtzNySgjFSCGbAlUUOkBwtYMTlKr9ZC5dpjm6lpVEAB0swQN5z8vYyTiL9b3h0gOjvBzf0pkkP+fpUq5rB8AU8mw5dOBG8You4DcDZq1grw+PS6ADEFERaTi4xZQ8VtPrnew+adBfh2h+p52lhIOUaefYBCmZYYp48JxXGblFe7y9D55DphS1S+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <b527d7c6-285e-4405-843a-6cbad306f8f4@opensynergy.com>
Date: Wed, 26 Jun 2024 13:07:17 +0200
From: Harald Mommer <harald.mommer@opensynergy.com>
Subject: Re: [PATCH] virtio-can: define out of rage can-id
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev, Matti Moell <Matti.Moell@opensynergy.com>
References: <ZkyrnsCXu8mQpDQI@fedora>
 <pf656j5da3lxgo2nn6nvhyz7tutf2rktbwxzddyhenyyvhzxpx@is6fo76auxms>
 <ZnWN3ePT6G6nL3N9@fedora>
Content-Language: en-US
In-Reply-To: <ZnWN3ePT6G6nL3N9@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:44::7)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2376:EE_|BEVP281MB3775:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7d34be-0dc6-430f-f777-08dc95d02517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0h4cENuek5uZUpkNGJycy9ubGUrN3U5V2RPREpjSTQ5VzdyUzFFWm4wWlZG?=
 =?utf-8?B?MHp6ZGJYN3A1eG1QUGZZRFd0UUorSm94UTZuZWNaNzk2WGVHakN6ckx3STY3?=
 =?utf-8?B?cFdHdXEwQk5MMHBlQVhCdDlkdTFvVVJRdWY2RHQ1THRqRGJ1MnM3bWJuZUpm?=
 =?utf-8?B?aVV3RlZxTmhLcjMwblBlL0pOcGttajBFZUVRT3lHTmdjZTBBYVZYUTh4aTJ4?=
 =?utf-8?B?NEpESjNtSWwzd1U3QjU1cUlyRDRjUXRkT1l0Wk5obFB6bk52OGFYeTQvVTdX?=
 =?utf-8?B?VE1LQmJsMkNTK1lSZXpqelhqbUE1UXJRUWx4dFA5alFLYmppaTRpc3hRNCtk?=
 =?utf-8?B?bmMrRWQ4NnBLYktkY2kyQmZ2UjNsMVJaWXozVURNTk5BUEo3b296ZDlNZEJK?=
 =?utf-8?B?ejB6dWM3RkVBMTVOWGNoOFZCZUljUkRKUjRoQ01NbFgxQ3ZtZlV4alMvTEhl?=
 =?utf-8?B?YkV5dVFuQ0laOU8wV25xVkhTRDJqRWg0cDRUV2h2a1I1K3doWmUrYlN4aDFi?=
 =?utf-8?B?Nm5VTVdPczM4R1ZSaHhIQzM1d3p6dXUrWGx2QllrNnB2ajQzaXZtV3V3TnBZ?=
 =?utf-8?B?dm5kUHpFcjBCM0tURzNHcGxkV1ZydnVtcVJ6bFd5U2hVelhqR1U3bm10LzI1?=
 =?utf-8?B?Y2Y0VVM3eUlNSlFVdU1WdkpRNHUzUVcvTTBDMDhUT1B0ZEl6ZHora1ZOQTFS?=
 =?utf-8?B?YnNjbm5NRVVyV0d2VUFEK20yMWE5MUJSRnpuUmpjRzlBaEtreEJCNFpjOGFN?=
 =?utf-8?B?WVlSMEZad2JndCsxOEgxWStxWDVuVFFqVTBmNy9aWnhzamtWdVB5V2ErYTlY?=
 =?utf-8?B?czdHMVZ6dU5BSTlXUGF6dEMzL3VxRlFJS2FyanVoa1Q0QUtrWkM2d2h2QXc2?=
 =?utf-8?B?U0xYSHFOMCtHVnBCN240R2x0ZWxDSHlCYjNqczYwclk0VFJubCt6bVpGbHBK?=
 =?utf-8?B?NFFiU05nYk0zTE9jUko2ZU1vOTNRVUZZMlJWL1ZYQWMxckFVRG8vdVV0TTlj?=
 =?utf-8?B?VGxFZkFBRXU3YkVkeXhROFF5NE5iMEF6bE9sSGJSTFpielp6MWM4UjNZYmU0?=
 =?utf-8?B?dkVxNmNqVlFFYUxOUDFUVG1aNEFUclBJVGNBWC8wSHAwS21aSm5tUVozdVF2?=
 =?utf-8?B?MFFHTkhpS2ZqWVpJUDVaY2hweTRmM3FBT2U5SGNPaHFYV2F3SWxpSXBrUnNu?=
 =?utf-8?B?L0VXb1NGTU5Vb25nVTE0WmZnbzh2NVVzZld1Tzk1NU1XM1BRcnZ0eks5alJH?=
 =?utf-8?B?U1BZMmtEVzBiQVlTOE5JNFBQN1NrQUhLZERVOEp2YVdmS1RaVVBOaWo3cFJh?=
 =?utf-8?B?ZysrTnhMWmcyV3RFcld5Q2VwQUZReDJVQnNiN2lSZXhJMVJLVUdVMloxZ3RZ?=
 =?utf-8?B?M0I2UXZQenN5b2tZSDhEVENJdzFJRWptY0V0WHcrSE5veUJ2SXBKMVFsVkl3?=
 =?utf-8?B?dVZvWnp3WTNqM0IyaVZwZmM4UHBKQVlnRHZrWGhvUlhjSmQ1OXpVbUxndEhH?=
 =?utf-8?B?Z3lGaWQ5QW5UKzRDTlBWMWhtclkyeExhbi9CZ3FUL0tmVjdNVEZLVjEyaWp2?=
 =?utf-8?B?c1o1YWxPc1d4MkhaRlRneVlLZm9HOC8zenVQRUswZEtiOEtMUEdnNkF3WWhx?=
 =?utf-8?B?dkN1UVVDcGEzaXFDZUlLeFBqZGxYdTliOUFUOUJMUHg0S3UxZE11RHJhQ2c0?=
 =?utf-8?B?YVFKdk4rb3RHS3JXeloxUmowQ3EvbC81aWRQUEtGVG9GTUE0LzBGZEswTW90?=
 =?utf-8?B?d25jZ0JwOFFwb2lqL2F4UCtuZEw5ZlBTcEc1bzlzb1kwS3pVbm53aVpORFU5?=
 =?utf-8?B?UHNIeVJLbFpqS2hyOGE5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(1800799022);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUVwTDJTYXBrODhiVHFUUXlvK3grWk9KVmt5SFJEa01TU1pQc3Rody9zWSta?=
 =?utf-8?B?bGZrVW5yZzRqaHN6WEw3cDJvZmdZNW8vUTRhZjU5VWVNMXViYVplY2JvVGE2?=
 =?utf-8?B?elYybnpIdXU2VDdDa3ZPNEluZE5yMXZQcnR4NVRZNkkySWtNQVhGSERFZFpL?=
 =?utf-8?B?SFlhcmYwYW9XL0IxS1BpbFhDOGpRazNVcWpRRkJnaDFsR0FmWnFsL3IrbVJa?=
 =?utf-8?B?TDdvZCtYOTdCQmVKM0tDSUJVM0VPcFdGR3BkY2llSGdjRWNyVjBUUFR0eUxh?=
 =?utf-8?B?N3l5MlgvcEVWTjFxSU41d1VWYjhLbm1oaWNWdzJOeUxjcmNKL3BjdlVHVUZQ?=
 =?utf-8?B?YXRqRk5INXB1TXdjam9RZ05HK2VkYmI4WllxK1J2OWEveXJ1NE1CRWpQbUEy?=
 =?utf-8?B?YTIzdnRWa045UUFTRHYySzVpKzRHaTVzNjNtNlp6ejl1TGl2aG9OWWtqRitC?=
 =?utf-8?B?b21VcWxzRVZaSXhvSnZlWFg5b3BCTUNwU3A2Wkg3eVFQVzNhS0FKcWVJaER4?=
 =?utf-8?B?WnF1a1paYnFwUVJJMExaVEVUSjdORVU4bVFiLzY5dVhjVkR4cTEwbS9taDdS?=
 =?utf-8?B?WFJmSk5kMnEyaEhEa2JkM3ZpRkZTalFxVlRNZ3F6RVV1VUl3bGxpWmhjUk1u?=
 =?utf-8?B?eFdOblhpdmNRZ1FaRDFiQTRzMzREbnNTZDRRNytxS2czM0hibmtOdWk2VTMv?=
 =?utf-8?B?Zlk3SWRpVUdJTE5yMHUyRklWUjlva1lycElscDdZejFFMlJGZHRheGR4MXYr?=
 =?utf-8?B?YUpXQmpBY0tXRDAvRVVIdXJvVzJ6dHNKWFo1UXJOdDFwQnZYdEdxTGR3T0pv?=
 =?utf-8?B?YVNTVER0ckRPanZGMHJaVllDeHlMRElWN3haYkk0UWZobGN5N3F2Smo1WU16?=
 =?utf-8?B?MVlSSkpEVURpelhyMVdON2txaW5XRzlRbDEvdTRjTGtuR0paQ2lJaVdzc1Vk?=
 =?utf-8?B?SnI1SHpmNmJZbHhBVFhYU25seVV1NDZ2SS9uclBuR1hDRXEybHRPSUt2R1Mz?=
 =?utf-8?B?OGtPL0FVL0hsTU84cTNsZnd3U1hHSStCUlZxcmNsZEM1L0RzS2VpZG5mU09X?=
 =?utf-8?B?cVZwa3ZGOFBhdDdBN2ZXejlQenc4NmRIVFp1cWZXVHZXb3VqZ0pUM1g1Umkv?=
 =?utf-8?B?K01jclhKbjdDUkhDb0lTZFVNdEovUW5Sb0V5Vlp3cmkzYzBoRUI3MEtMRHRn?=
 =?utf-8?B?QSs5OFQyRm0zQmRJWngzSUpVSWN3akJvMDl4V1BpZ0tPSm5lK3Rqa1RweWR4?=
 =?utf-8?B?a0NpVDR4RVM3TGpzVGYwNDlRa09aeWY3dHRqekR2eURObUFmTTgxZ1RBM0Vk?=
 =?utf-8?B?RUN2Njl6eGl4ZG5NNW1JemNnY1k2Vi9OQzZhcG1QTGNZVHpFUjBUWi9ZR3Zr?=
 =?utf-8?B?a3A5YXNpVHBOcys0OEdURzJCcURSUHE2Q2k5WURaNU8reEZHWVRjd0xDWCs2?=
 =?utf-8?B?TU5xaDdXb3IrSlNIOE5hRVcvU1R2ZUZOd0U4Nytpd1dDUDQwcmNHWVRNY29i?=
 =?utf-8?B?eXhvajBIdUF5Z2YyVFc1NmFJM3YvOVlvMFlVSFpZalhIUFZLU3gxUmJXWlda?=
 =?utf-8?B?OHpNaWRveHpsMVpFNXh1QXRVVUhSNFJ3NEViMzd2SjhOMVlhUGVGZWljL3Ro?=
 =?utf-8?B?YlVhd3c1ODhlQkowZVkxc1dlNWtlM0NlNWw5VmFENkNwaEhsa2R2N3B3RHRQ?=
 =?utf-8?B?emJUQmpuQXlEam12RGtNZmUwK1JDRFRsQ0QzUndFNkdSTHIvalhVYzErWXlY?=
 =?utf-8?B?cEF5UkpkYzFQL0VjYjI4R2xFMEcyb0NhU0ZUSWNScHhrZEJWZnlpQmRGOWtk?=
 =?utf-8?B?bitsRCtrbmhxRFVqakhmRFc2TGRMQUJRd01VNE00cUdOY0xPZ0tGeUZuTzJV?=
 =?utf-8?B?OHRqUFEwaE43eUFpTUxLUlAxaW1tRzBZRFBBYkNoUDV3SEp3eWhJUFJEUG00?=
 =?utf-8?B?M2pEY1k1L0trMW1JQ1BFRm5jWXlPOVNkcHBSYlR5OVcwWGZPTWVlcTVHZHRq?=
 =?utf-8?B?YlJPQ0dObkxSVjMxY0YwellBN2Fqc0E0dTlIWW9oZzJIY1k5dFVPNEZ3UlhK?=
 =?utf-8?B?N0RUNDlTK2lLeTZRaFR0L1c2YXZFbnF5azM4Yys5ZFJOOWJRZHpGSHh3bEo5?=
 =?utf-8?Q?dupwl4TL5R9L+i+pWwhIL6gPN?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7d34be-0dc6-430f-f777-08dc95d02517
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 11:07:18.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTWCc5jd6B2Q+SKhx9Ae7RS8CsYqogyP9qCSSQbF3booQF9WAJqGkhFJ0wretizRnj6wq9H+FQ/r8gG4N8tfgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEVP281MB3775
X-TM-AS-ERS: 40.93.78.51-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28482.007
X-TMASE-Result: 10--9.980500-4.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/1TzAVQ78TKJRhvdi92BBAuzmG9pmg8ncL7Bamin45J3Jmg
	kd7c0mklVhCBaP+XXYyYXHiLsDcWhlGySNoYMxCeGQ+246vupTBs2NNIWkvEKNrm58Qo63ifw6p
	ZIvFu52GshSMzOjUBhwbcQc2v9gfXAGxExCnOj8pv0HRrhcX/T+A4l73CwysLclSUqoTBU/XTE8
	l3EsMoY3+kCdLTfNq+aWJuMVVDR/tQNSduDrySH6SYFFz3IpxkyfjF8MS6pxVBRmUI+A4g/IXrN
	S+xKlbqsQO6Vch/CfaNfczRoWaFQ7DP95vZKN8oWWSz4drjSLhimmowi1sSA4j+QP7WhY0Zv9rS
	d36EgUIj80Za3RRg8NYnTGwbnq/LNHoPuPKUvNoioXV+CEc43K8xY9oGePDRCDUQSyHO5RI=
X-TMASE-XGENCLOUD: 83c2289e-f68c-4969-8a2e-75dd97595dd3-0-0-200-0
X-TM-Deliver-Signature: F737E36D7AED75B02CD14CEDD8D2F679
X-TM-Addin-Auth: qtRtfT2k/HfBj9BsWNpggYsGSxDHEEtAFx1NbnqR5NavpLbXolRYkkqn4e2
	PsUG+Tze8m7JIhB3pvFvs1Rd3CVhfjkX9A643708nZSjIdCmdX/pMBscc9qQqIYTaxq3JwwdcNa
	xbNYOyCJ9Zc105E/4uv+9/0e7LxEDH+JtF23NfkdcAnMmC+HZjJ6qFbDgtVXjrsvinn6lZaUxwl
	ChKoGxnPnwN46WC1M310ZN44e3ESSCOrcpECJ10fi7TkW5lybhld8ieYKDKMr8FeeDafJ+q2P0/
	+5KvEAB2OIh5wXg=.TfyhxiouYjRpi1jG68QNkMoJ6hhrxw/X6+EduDrB8FNe41CA+VAMtyf1Kw
	lBZApUeNts5JxUERxnZKaG47UwhE8LQ1DpsvmYRSGuYZ1ZU2kpdlfyYR5VBzla3HL+ckKV5QKVj
	BYALr9BgeJwLkE8ocYax/r05b20cwBdNaV0YVyLM2AnN61dHEeFO2gb3SFxuAYJEZDTfAAy6X4+
	7LvSi+O8rP+9NzT2z10XuDUpLvSiE4o969Im2qd9tmrI9LEj9mrcieXHAmWQOkoXSdHbPaDhk8t
	ihRkD9go9H+uD2NdnzNiG/4+zyopqLDufHcF2XZIatORj1JQMX+rqFzSCbg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719400040;
	bh=P2HPA2Oxz+Jd3aC3EKiN28KIGRxKd156GBcfB7ETMOg=; l=2002;
	h=Date:From:To;
	b=LV16l8yuk1TBCEgv9rXEc1BJQq/6ND8FH2dKpklCmoUOS6VJSAywsUwffUv/0xFKW
	 xYtMn3+BmPWifyTgjWl/jy7SRXvJTFQ87xFKg7xKyo813aUVgpUtRGlNDBqCo3bTnw
	 1SE8nTP72419tObXzQXg+zHkK2aExIoAXxceffkDi531eCpm5SpZx+OJfG1XcIcaKf
	 Bzycgz/OOau/chER8x4J/kmigmVrcepxzyJ79R26QiqGRJZEQB05PjJUeY7ZXx3q2S
	 Yr8Oe2vgRg/t3bZSIl8anKX6i/STi3lOJq/zjAq/qKwCKOAVUiTxkf46SzMkhvNLTx
	 BMn8iP6RooEMQ==


On 21.06.24 16:27, Matias Ezequiel Vara Larsen wrote:
> On Wed, Jun 05, 2024 at 10:42:19AM +0200, Stefano Garzarella wrote:
>> On Tue, May 21, 2024 at 04:11:42PM GMT, Matias Ezequiel Vara Larsen wrote:
>>> Explain when a message is out of range.
>>>
>>> Signed-off-by: Matias Ezequiel Vara Larsen<mvaralar@redhat.com>
>>> ---
>>> * This patch applies on top of virtio-1.4, which has not been released
>>>   yet.
>>> ---
>>> device-types/can/description.tex | 3 +++
>>> 1 file changed, 3 insertions(+)
>>>
>>> diff --git a/device-types/can/description.tex b/device-types/can/description.tex
>>> index 2511d9c..98b163b 100644
>>> --- a/device-types/can/description.tex
>>> +++ b/device-types/can/description.tex
>>> @@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
>>> invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
>>> NOT schedule the message for transmission.
>>>
>>> +Note that a message is out of range when a standard frame uses more than 11
>>> +bits of \field{can_id} or when an extended frame uses more than 29 bits.
>>> +
>>
Non-extended CAN frame and can_id contains more than 11 bits (not in 
range 0..7FFH) => broken.

Extended CAN frame and can_id contains more than 29 bits (not in range 
0..1FFFFFFFH) => broken.

See also 5.20.3 "Feature bits", there it's mentioned but not this 
prominently.

Classic CAN frame and sdu length > 8 bytes => broken.

Comes from ISO 11898-1:2015, should have been mentioned more clearly 
here as it was done in 5.20.3. There is not stated that the allowed 
value range is 0..8. Obvious for CAN people, not obvious for anybody else.

CAN FD frame and sdu length > 8 bytes and not in the set { 12, 16, 20, 
24, 32, 48, 64 } bytes => broken.

Comes from ISO 11898-1:2015, is not obvious for people not too familiar 
with CAN FD and is missing in the virtio CAN specification.

This is what was meant. Now some good wording is needed.


